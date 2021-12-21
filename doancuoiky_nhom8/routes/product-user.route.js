import express from 'express';
import moment from 'moment';
import productModel from '../models/product.model.js';
import accountModel from '../models/account.model.js';
import fileModel from '../models/upload.model.js';
import watchListModel from '../models/watchlist.model.js';
import biddingModel from '../models/bidding.model.js';
import checkPermission from '../middlewares/permission.mdw.js';

const router = express.Router();

router.get('/', async function (req, res){
    const sort = req.body.sort || '0'; // 1 là theo thời gian kết thúc giảm dần, 2 là giá tăng dần, 0 là không sort
    const result = await productModel.getAllProduct(sort);
    moment.locale('vi');
    var end_date = [];
    for (let i =0 ; i < result.length; i++){
        end_date.push(0);
    }
    for(let i =0 ; i < result.length; i++){
        if(result[i].buy_now_price == 0){
            delete result[i].buy_now_price;
        }
        end_date[i] = moment(result[i].time_end, 'YYYY/MM/DD HH:mm:ss');
        if(end_date[i].diff(moment(), 'days') < 3){
            result[i].price_color = false;
            result[i].time_end = end_date[i].fromNow();
        }
        else{
            result[i].price_color = true;
            result[i].time_end = moment(result[i].time_end,
                'YYYY/MM/DD hh:mm:ss').format('DD/MM/YYYY HH:mm:ss');
        }
        result[i].time_start = moment(result[i].time_start,
            'YYYY/MM/DD HH:mm:ss').format('DD/MM/YYYY HH:mm:ss');
        result[i].img = fileModel.getAllFileName('./public/img/products/' + result[i].id, result[i].id);
        result[i].bidHistory = await productModel.getBidHistory(result[i].id);
    }
    res.render('vwProduct/products',{
        result
    });
});

router.get('/search_result', async function (req, res){
    res.render('vwProduct/product_search_result', {
        layout: 'non_sidebar.hbs'
    });
});

router.post('/search_result', async function (req, res){
    const cateID = req.body.search_cateID;
    const param = req.body.search_param;
    const sort = req.body.sort || '0'; // 1 là theo thời gian kết thúc giảm dần, 2 là giá tăng dần, 0 là không sort
    const search_result = await productModel.searchProduct(cateID,param,sort);
    moment.locale('vi');
    var end_date = [];
    for (let i =0 ; i < search_result.length; i++){
        end_date.push(0);
    }
    for(let i =0 ; i < search_result.length; i++){
        if(search_result[i].buy_now_price == 0){
            delete search_result[i].buy_now_price;
        }
        end_date[i] = moment(search_result[i].time_end, 'YYYY/MM/DD HH:mm:ss');
        if(end_date[i].diff(moment(), 'days') < 3){
            search_result[i].price_color = false;
            search_result[i].time_end = end_date[i].fromNow();
        }
        else{
            search_result[i].price_color = true;
            search_result[i].time_end = moment(search_result[i].time_end,
                'YYYY/MM/DD hh:mm:ss').format('DD/MM/YYYY HH:mm:ss');
        }
        search_result[i].time_start = moment(search_result[i].time_start,
            'YYYY/MM/DD HH:mm:ss').format('DD/MM/YYYY HH:mm:ss');
        search_result[i].img = fileModel.getAllFileName('./public/img/products/' + search_result[i].id, search_result[i].id);
        search_result[i].bidHistory = await productModel.getBidHistory(search_result[i].id);
    }
    console.log(search_result);
    res.render('vwProduct/product_search_result', {
        layout: 'non_sidebar.hbs',
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
	console.log(cateID);
	const sort = req.body.sort || '0'; // 1 là theo thời gian kết thúc giảm dần, 2 là giá tăng dần, 0 là không sort
	const result = await productModel.getProductByIdCtg(cateID,sort);
	moment.locale('vi');
	var end_date = [];
	for (let i =0 ; i < result.length; i++){
		end_date.push(0);
	}
	for(let i =0 ; i < result.length; i++){
		if(result[i].buy_now_price == 0){
			delete result[i].buy_now_price;
		}
		end_date[i] = moment(result[i].time_end, 'YYYY/MM/DD HH:mm:ss');
		if(end_date[i].diff(moment(), 'days') < 3){
			result[i].price_color = false;
			result[i].time_end = end_date[i].fromNow();
		}
		else{
			result[i].price_color = true;
			result[i].time_end = moment(result[i].time_end,
				'YYYY/MM/DD hh:mm:ss').format('DD/MM/YYYY HH:mm:ss');
		}
		result[i].time_start = moment(result[i].time_start,
			'YYYY/MM/DD HH:mm:ss').format('DD/MM/YYYY HH:mm:ss');
		result[i].img = fileModel.getAllFileName('./public/img/products/' + result[i].id, result[i].id);
		result[i].bidHistory = await productModel.getBidHistory(result[i].id);
	}
	res.render('vwCategory/show-product', {
		// layout: 'non_sidebar.hbs',
		cateID,
		result
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

export default router;