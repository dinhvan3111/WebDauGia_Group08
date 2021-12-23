import express from 'express';
import moment from 'moment';
import pagingInfo from '../utils/paging.helper.js';
import productModel from '../models/product.model.js';
import accountModel from '../models/account.model.js';
import fileModel from '../models/upload.model.js';
import watchListModel from '../models/watchlist.model.js';
import biddingModel from '../models/bidding.model.js';
import checkPermission from '../middlewares/permission.mdw.js';

const router = express.Router();

router.get('/', async function (req, res){
    const limit = 9;
    const page = req.query.page || 1;
    const offset = (page -1) * limit;
    const total = await productModel.countPageByAll();

    const paging = pagingInfo.getPagingInfo(limit, page, total);

    const sort = req.query.sort || '0'; // 1 là theo thời gian kết thúc giảm dần, 2 là giá tăng dần, 0 là không sort
    var result = await productModel.findPageAllProduct(limit,offset,sort);
    result = await productModel.getProductsDisplayByCard(result);
    res.render('vwProduct/products',{
                page,
                nextPage: paging.nextPage, 
                prePage: paging.prePage, 
                disableNext: paging.disableNext, 
                disablePre: paging.disablePre,
                pageNumber: paging.pageNumber,
                result
    });
});

router.get('/search_result', async function (req, res){
    const cateID = req.query.cateID;
    const param = req.query.param;
    const limit = 8;
    const page = req.query.page || 1;
    const offset = (page -1) * limit;
    const total = await productModel.countSearchProduct(cateID,param);

    const paging = pagingInfo.getPagingInfo(limit, page, total);

    const sort = req.body.sort || '0'; // 1 là theo thời gian kết thúc giảm dần, 2 là giá tăng dần, 0 là không sort
    var search_result = await productModel.searchProduct(cateID,param,limit,offset,sort);
    search_result = await productModel.getProductsDisplayByCard(search_result);
    res.render('vwProduct/product_search_result', {
                layout: 'non_sidebar.hbs',
                page,
                nextPage: paging.nextPage,
                prePage: paging.prePage,
                disableNext: paging.disableNext,
                disablePre: paging.disablePre,
                pageNumber: paging.pageNumber,
                cateID,
                param,
                search_result
    });
});


router.get('/:id', async function (req, res, next){
    const id_product = req.params.id;
    const product_info = await productModel.findID(id_product);
    if(product_info === null){
        next();
        return;
    }
    if(product_info.not_sold == 0){
        product_info.priceSold = product_info.price;
    }
    const info = await productModel.getProductDetail(req, product_info, id_product);
    if(info.bidHistory){
        for(let i =0; i < info.bidHistory.length; i++){
            const starPercentage = accountModel.starPercentage(info.bidHistory[i].ratio);
            // Làm tròn số sao
            const starPercentageRounded = accountModel.starPercentageRounded(info.bidHistory[i].ratio);
            info.bidHistory[i].starPercentage = starPercentage;
            info.bidHistory[i].starPercentageRounded = starPercentageRounded;
        }
    }
    var ratioSeller = await accountModel.getUpVoteRatio(info.seller.id);
    const starPercentage = accountModel.starPercentage(ratioSeller.ratio);
    const starPercentageRounded = accountModel.starPercentageRounded(ratioSeller.ratio);
    info.seller.starPercentage = starPercentage;
    info.seller.starPercentageRounded = starPercentageRounded;
    
    return res.render('vwProduct/product_detail',{
        layout: 'non_sidebar.hbs',
        id: id_product,
        product: product_info,
        seller: info.seller,
        bidHistory: info.bidHistory, 
        inWatchList: info.inWatchList,
        canEdit: info.canEdit,
        ignored: info.ignored,
        isHoldingPrice: info.isHoldingPrice,
        max_bid_price: info.max_bid_price,
        canBid: info.canBid,
        startDate: info.startDate,
        notEnoughVotes: info.notEnoughVotes});
});
router.get('/list/:id', async function (req, res){
    const cateID = req.params.id;

    const limit = 9;
    const page = req.query.page || 1;
    const offset = (page -1) * limit;
    const total = await productModel.countPageByIdCtg(cateID);
    const paging = pagingInfo.getPagingInfo(limit, page, total);

    const sort = req.query.sort || '0'; // 1 là theo thời gian kết thúc giảm dần, 2 là giá tăng dần, 0 là không sort
    var result = await productModel.findPagebyCatId(cateID,limit,offset, sort);
    
    result = await productModel.getProductsDisplayByCard(result);

    res.render('vwCategory/show-product', {
                // layout: 'non_sidebar.hbs',
            
                page,
                nextPage: paging.nextPage, 
                prePage: paging.prePage, 
                disableNext: paging.disableNext, 
                disablePre: paging.disablePre,
                pageNumber: paging.pageNumber,
                result,
    });
});

router.post('/add-to-watch-list', checkPermission.notLogin, async function(req, res){
    const id = req.body.id;
    const id_acc = req.user.id;
    const product = await productModel.findID(id);
    if(product !== null){
        const isExisted = await watchListModel.findObj({id_acc: id_acc, id_product: id});
        if(isExisted === null){
            await watchListModel.add(id_acc, id);
        }
    }
    else{
        return res.redirect(req.headers.referer);
    }
    return res.redirect('/products/' + id);
});

router.post('/:id/bidding', checkPermission.notLogin, async function(req, res){
    await biddingModel.autoAuction(req);
    return res.redirect(req.headers.referer);
});

router.post('/:id/buy-now', checkPermission.notLogin, async function(req, res){
    const product_info = await productModel.findID(req.params.id);
    if(product_info !== null && product_info.buy_now_price !== null &&
                    req.user.id != product_info.id_seller){
        
        const isIgnored = await productModel.findIgnoredBidders({
                                id_product: product_info.id,
                                id_acc: req.user.id});
        if(isIgnored === null){
            const bidder_info = await accountModel.findID(req.user.id);
            const domain = req.protocol + '://' + req.headers.host;
            await productModel.buyNow(bidder_info, product_info, domain);
        }
    }
    res.redirect(req.headers.referer);
});

router.get('/watch-list',checkPermission.notLogin, async function (req, res){
    const sort = req.body.sort || '0'; // 1 là theo thời gian kết thúc giảm dần, 2 là giá tăng dần, 0 là không sort
    const id = req.session.passport.user.id;
    const limit = 9;
    const page = req.query.page || 1;
    const offset = (page -1) * limit;
    var total;
    total = await watchListModel.countWatchProductById(id);

    const paging = pagingInfo.getPagingInfo(limit, page, total);
    const watch_list = await watchListModel.getWatchListById(id,limit,offset);
    var result = null;
    if(watch_list !== null) {
        var products = [];
        for (var i = 0; i < watch_list.length; i++) {
            var product = await productModel.findID(watch_list[i].id_product);
            products.push(product);
        }
        result = await productModel.getProductsDisplayByCard(products);
        // result = products;
    }



    res.render('vwProduct/products',{
                page,
                nextPage: paging.nextPage, 
                prePage: paging.prePage, 
                disableNext: paging.disableNext, 
                disablePre: paging.disablePre,
                pageNumber: paging.pageNumber,
                result,
                title:"yêu thích"
    });
});
router.get('/won',checkPermission.notLogin, async function (req, res){
    const sort = req.body.sort || '0'; // 1 là theo thời gian kết thúc giảm dần, 2 là giá tăng dần, 0 là không sort
    const id = req.session.passport.user.id;
    const limit = 9;
    const page = req.query.page || 1;
    const offset = (page -1) * limit;
    var total;
    total = await productModel.countWonProductByIdAcc(id);
    const paging = pagingInfo.getPagingInfo(limit, page, total);
    const products = await productModel.getWonProductByIdAcc(id,limit,offset);
    var result = null;
    if(products !== null) {

        result = await productModel.getProductsDisplayByCard(products);
        // result = products;
    }


    res.render('vwProduct/products',{
                page,
                nextPage: paging.nextPage, 
                prePage: paging.prePage, 
                disableNext: paging.disableNext, 
                disablePre: paging.disablePre,
                pageNumber: paging.pageNumber,
                result,
                title:"đã chiến thắng"
    });
});
router.get('/posted',checkPermission.isNotSeller, async function (req, res){
    const sort = req.body.sort || '0'; // 1 là theo thời gian kết thúc giảm dần, 2 là giá tăng dần, 0 là không sort
    const id = req.session.passport.user.id;
    const limit = 9;
    const page = req.query.page || 1;
    const offset = (page -1) * limit;
    var total;
    total = await productModel.countPostedProductByIdAcc(id);
    const paging = pagingInfo.getPagingInfo(limit, page, total);
    const products = await productModel.getPostedProductByIdAcc(id,limit,offset);
    var result = null;
    if(products !== null) {

        result = await productModel.getProductsDisplayByCard(products);
        // result = products;
    }




    res.render('vwProduct/products',{
                page,
                nextPage: paging.nextPage, 
                prePage: paging.prePage, 
                disableNext: paging.disableNext, 
                disablePre: paging.disablePre,
                pageNumber: paging.pageNumber,
                result,
                title:"đã đăng"
    });
});

router.get('/bidding',checkPermission.isNotSeller, async function (req, res){
    const sort = req.body.sort || '0'; // 1 là theo thời gian kết thúc giảm dần, 2 là giá tăng dần, 0 là không sort
    const id = req.session.passport.user.id;
    const limit = 9;
    const page = req.query.page || 1;
    const offset = (page -1) * limit;
    var total = await productModel.countProductBiddingById(id);
    console.log('total::::::;', total)
    const paging = pagingInfo.getPagingInfo(limit, page, total);
    const products = await productModel.getProductBiddingById(id, limit, offset);
    console.log(products)
    var result = null;
    if(products !== null) {

        result = await productModel.getProductsDisplayByCard(products);
        // result = products;
    }


    
    res.render('vwProduct/products',{
                page,
                nextPage: paging.nextPage, 
                prePage: paging.prePage, 
                disableNext: paging.disableNext, 
                disablePre: paging.disablePre,
                pageNumber: paging.pageNumber,
                result,
                title:" đang đấu giá"
    });
});

export default router;