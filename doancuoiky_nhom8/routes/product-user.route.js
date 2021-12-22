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
    const limit = 9;
    const page = req.query.page || 1;
    const offset = (page -1) * limit;
    const total = await productModel.countPageByAll();
    let nPages = Math.floor(total / limit);
    if(total % limit > 0) nPages++;
    var nextPage, prePage, disableNext, disablePre;
    if(nPages === 0 || nPages === 1){
        disableNext = true;
        disablePre = true;
    }
    else if(+page === 1){
        prePage = +page;
        nextPage = +page + 1;
        disableNext = false;
        disablePre = true;
    }
    else if(+page === nPages){
        prePage = +page - 1;
        nextPage = +page;
        disableNext = true;
        disablePre = false;
    }
    else{
        nextPage = +page + 1;
        prePage = +page - 1;
        disableNext = false;
        disablePre = false;
    }
    const pageNumber = [];
    for(let i =1; i<= nPages; i++){
        pageNumber.push({
            value: i,
            isCurrent: +page == i
        });
    }
    const sort = req.query.sort || '0'; // 1 là theo thời gian kết thúc giảm dần, 2 là giá tăng dần, 0 là không sort
    const result = await productModel.findPageAllProduct(limit,offset,sort);
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
        page,
        nextPage, prePage, disableNext, disablePre,
        pageNumber,
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
    const limit = 8;
    const page = req.query.page || 1;
    const offset = (page -1) * limit;
    const total = await productModel.countSearchProduct(cateID,param);
    let nPages = Math.floor(total / limit);
    if(total % limit > 0) nPages++;
    var nextPage, prePage, disableNext, disablePre;
    if(nPages === 0 || nPages === 1){
        disableNext = true;
        disablePre = true;
    }
    else if(+page === 1){
        prePage = +page;
        nextPage = +page + 1;
        disableNext = false;
        disablePre = true;
    }
    else if(+page === nPages){
        prePage = +page - 1;
        nextPage = +page;
        disableNext = true;
        disablePre = false;
    }
    else{
        nextPage = +page + 1;
        prePage = +page - 1;
        disableNext = false;
        disablePre = false;
    }
    const pageNumber = [];
    for(let i =1; i<= nPages; i++){
        pageNumber.push({
            value: i,
            isCurrent: +page == i
        });
    }
    const sort = req.body.sort || '0'; // 1 là theo thời gian kết thúc giảm dần, 2 là giá tăng dần, 0 là không sort
    const search_result = await productModel.searchProduct(cateID,param,limit,offset,sort);
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
    res.render('vwProduct/product_search_result', {
        layout: 'non_sidebar.hbs',
        page,
        nextPage, prePage, disableNext, disablePre,
        pageNumber,
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
    let nPages = Math.floor(total / limit);
    if(total % limit > 0) nPages++;
    var nextPage, prePage, disableNext, disablePre;
    if(nPages === 0 || nPages === 1){
        disableNext = true;
        disablePre = true;
    }
    else if(+page === 1){
        prePage = +page;
        nextPage = +page + 1;
        disableNext = false;
        disablePre = true;
    }
    else if(+page === nPages){
        prePage = +page - 1;
        nextPage = +page;
        disableNext = true;
        disablePre = false;
    }
    else{
        nextPage = +page + 1;
        prePage = +page - 1;
        disableNext = false;
        disablePre = false;
    }
    const pageNumber = [];
    for(let i =1; i<= nPages; i++){
        pageNumber.push({
            value: i,
            isCurrent: +page == i
        });
    }

    const sort = req.query.sort || '0'; // 1 là theo thời gian kết thúc giảm dần, 2 là giá tăng dần, 0 là không sort
    const result = await productModel.findPagebyCatId(cateID,limit,offset, sort);
    console.log(result);
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
        page,
        nextPage, prePage, disableNext, disablePre,
        pageNumber,
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

router.get('/watch-list',checkPermission.notLogin, async function (req, res){
    const sort = req.body.sort || '0'; // 1 là theo thời gian kết thúc giảm dần, 2 là giá tăng dần, 0 là không sort
    const id = req.session.passport.user.id;
    const limit = 9;
    const page = req.query.page || 1;
    const offset = (page -1) * limit;
    var total;
    total = await watchListModel.countWatchProductById(id);
    let nPages = Math.floor(total / limit);
    if(total % limit > 0) nPages++;
    var nextPage, prePage, disableNext, disablePre;
    if(nPages === 0 || nPages === 1){
        disableNext = true;
        disablePre = true;
    }
    else if(+page === 1){
        prePage = +page;
        nextPage = +page + 1;
        disableNext = false;
        disablePre = true;
    }
    else if(+page === nPages){
        prePage = +page - 1;
        nextPage = +page;
        disableNext = true;
        disablePre = false;
    }
    else{
        nextPage = +page + 1;
        prePage = +page - 1;
        disableNext = false;
        disablePre = false;
    }
    const pageNumber = [];
    for(let i =1; i<= nPages; i++){
        pageNumber.push({
            value: i,
            isCurrent: +page == i
        });
    }
    const watch_list = await watchListModel.getWatchListById(id,limit,offset);
    var result;
    if(watch_list !== null) {
        var products = [];
        for (var i = 0; i < watch_list.length; i++) {
            var product = await productModel.findID(watch_list[i].id_product);
            products.push(product);
        }
        console.log(products);
        moment.locale('vi');
        var end_date = [];
        for (let i = 0; i < products.length; i++) {
            end_date.push(0);
        }
        for (let i = 0; i < products.length; i++) {
            if (products[i].buy_now_price == 0) {
                delete products[i].buy_now_price;
            }
            end_date[i] = moment(products[i].time_end, 'YYYY/MM/DD HH:mm:ss');
            if (end_date[i].diff(moment(), 'days') < 3) {
                products[i].price_color = false;
                products[i].time_end = end_date[i].fromNow();
            } else {
                products[i].price_color = true;
                products[i].time_end = moment(products[i].time_end,
                    'YYYY/MM/DD hh:mm:ss').format('DD/MM/YYYY HH:mm:ss');
            }
            products[i].time_start = moment(products[i].time_start,
                'YYYY/MM/DD HH:mm:ss').format('DD/MM/YYYY HH:mm:ss');
            products[i].img = fileModel.getAllFileName('./public/img/products/' + products[i].id, products[i].id);
            products[i].bidHistory = await productModel.getBidHistory(products[i].id);
        }
        result = products;
    }
    else{
        result = null;
    }
    res.render('vwProduct/products',{
        page,
        nextPage, prePage, disableNext, disablePre,
        pageNumber,
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
    let nPages = Math.floor(total / limit);
    if(total % limit > 0) nPages++;
    var nextPage, prePage, disableNext, disablePre;
    if(nPages === 0 || nPages === 1){
        disableNext = true;
        disablePre = true;
    }
    else if(+page === 1){
        prePage = +page;
        nextPage = +page + 1;
        disableNext = false;
        disablePre = true;
    }
    else if(+page === nPages){
        prePage = +page - 1;
        nextPage = +page;
        disableNext = true;
        disablePre = false;
    }
    else{
        nextPage = +page + 1;
        prePage = +page - 1;
        disableNext = false;
        disablePre = false;
    }
    const pageNumber = [];
    for(let i =1; i<= nPages; i++){
        pageNumber.push({
            value: i,
            isCurrent: +page == i
        });
    }
    const products = await productModel.getWonProductByIdAcc(id,limit,offset);
    var result;
    if(products !== null) {

        moment.locale('vi');
        var end_date = [];
        for (let i = 0; i < products.length; i++) {
            end_date.push(0);
        }
        for (let i = 0; i < products.length; i++) {
            if (products[i].buy_now_price == 0) {
                delete products[i].buy_now_price;
            }
            end_date[i] = moment(products[i].time_end, 'YYYY/MM/DD HH:mm:ss');
            if (end_date[i].diff(moment(), 'days') < 3) {
                products[i].price_color = false;
                products[i].time_end = end_date[i].fromNow();
            } else {
                products[i].price_color = true;
                products[i].time_end = moment(products[i].time_end,
                    'YYYY/MM/DD hh:mm:ss').format('DD/MM/YYYY HH:mm:ss');
            }
            products[i].time_start = moment(products[i].time_start,
                'YYYY/MM/DD HH:mm:ss').format('DD/MM/YYYY HH:mm:ss');
            products[i].img = fileModel.getAllFileName('./public/img/products/' + products[i].id, products[i].id);
            products[i].bidHistory = await productModel.getBidHistory(products[i].id);
        }
        result = products;
    }
    else{
        result = null;
    }
    res.render('vwProduct/products',{
        page,
        nextPage, prePage, disableNext, disablePre,
        pageNumber,
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
    let nPages = Math.floor(total / limit);
    if(total % limit > 0) nPages++;
    var nextPage, prePage, disableNext, disablePre;
    if(nPages === 0 || nPages === 1){
        disableNext = true;
        disablePre = true;
    }
    else if(+page === 1){
        prePage = +page;
        nextPage = +page + 1;
        disableNext = false;
        disablePre = true;
    }
    else if(+page === nPages){
        prePage = +page - 1;
        nextPage = +page;
        disableNext = true;
        disablePre = false;
    }
    else{
        nextPage = +page + 1;
        prePage = +page - 1;
        disableNext = false;
        disablePre = false;
    }
    const pageNumber = [];
    for(let i =1; i<= nPages; i++){
        pageNumber.push({
            value: i,
            isCurrent: +page == i
        });
    }
    const products = await productModel.getPostedProductByIdAcc(id,limit,offset);
    var result;
    if(products !== null) {

        moment.locale('vi');
        var end_date = [];
        for (let i = 0; i < products.length; i++) {
            end_date.push(0);
        }
        for (let i = 0; i < products.length; i++) {
            if (products[i].buy_now_price == 0) {
                delete products[i].buy_now_price;
            }
            end_date[i] = moment(products[i].time_end, 'YYYY/MM/DD HH:mm:ss');
            if (end_date[i].diff(moment(), 'days') < 3) {
                products[i].price_color = false;
                products[i].time_end = end_date[i].fromNow();
            } else {
                products[i].price_color = true;
                products[i].time_end = moment(products[i].time_end,
                    'YYYY/MM/DD hh:mm:ss').format('DD/MM/YYYY HH:mm:ss');
            }
            products[i].time_start = moment(products[i].time_start,
                'YYYY/MM/DD HH:mm:ss').format('DD/MM/YYYY HH:mm:ss');
            products[i].img = fileModel.getAllFileName('./public/img/products/' + products[i].id, products[i].id);
            products[i].bidHistory = await productModel.getBidHistory(products[i].id);
        }
        result = products;
    }
    else{
        result = null;
    }
    res.render('vwProduct/products',{
        page,
        nextPage, prePage, disableNext, disablePre,
        pageNumber,
        result,
        title:"đã đăng"
    });
});
router.get('/bidding',checkPermission.isNotSeller, async function (req, res){
    const sort = req.body.sort || '0'; // 1 là theo thời gian kết thúc giảm dần, 2 là giá tăng dần, 0 là không sort
    const id = req.session.passport.user.id;
    // const limit = 9;
    // const page = req.query.page || 1;
    // const offset = (page -1) * limit;
    // var total;
    // total = await productModel.countProductBiddingById(id);
    // let nPages = Math.floor(total / limit);
    // if(total % limit > 0) nPages++;
    // var nextPage, prePage, disableNext, disablePre;
    // if(nPages === 0 || nPages === 1){
    //     disableNext = true;
    //     disablePre = true;
    // }
    // else if(+page === 1){
    //     prePage = +page;
    //     nextPage = +page + 1;
    //     disableNext = false;
    //     disablePre = true;
    // }
    // else if(+page === nPages){
    //     prePage = +page - 1;
    //     nextPage = +page;
    //     disableNext = true;
    //     disablePre = false;
    // }
    // else{
    //     nextPage = +page + 1;
    //     prePage = +page - 1;
    //     disableNext = false;
    //     disablePre = false;
    // }
    // const pageNumber = [];
    // for(let i =1; i<= nPages; i++){
    //     pageNumber.push({
    //         value: i,
    //         isCurrent: +page == i
    //     });
    // }
    const products = await productModel.getProductBiddingById(id,limit,offset);
    console.log(products)
    var result;
    if(products !== null) {

        moment.locale('vi');
        var end_date = [];
        for (let i = 0; i < products.length; i++) {
            end_date.push(0);
        }
        for (let i = 0; i < products.length; i++) {
            if (products[i].buy_now_price == 0) {
                delete products[i].buy_now_price;
            }
            end_date[i] = moment(products[i].time_end, 'YYYY/MM/DD HH:mm:ss');
            if (end_date[i].diff(moment(), 'days') < 3) {
                products[i].price_color = false;
                products[i].time_end = end_date[i].fromNow();
            } else {
                products[i].price_color = true;
                products[i].time_end = moment(products[i].time_end,
                    'YYYY/MM/DD hh:mm:ss').format('DD/MM/YYYY HH:mm:ss');
            }
            products[i].time_start = moment(products[i].time_start,
                'YYYY/MM/DD HH:mm:ss').format('DD/MM/YYYY HH:mm:ss');
            products[i].img = fileModel.getAllFileName('./public/img/products/' + products[i].id, products[i].id);
            products[i].bidHistory = await productModel.getBidHistory(products[i].id);
        }
        result = products;
    }
    else{
        result = null;
    }
    res.render('vwProduct/products',{
        // page,
        // nextPage, prePage, disableNext, disablePre,
        // pageNumber,
        result,
        title:" đang đấu giá"
    });
});
export default router;