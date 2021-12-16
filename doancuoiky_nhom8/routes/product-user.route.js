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
    res.render('vwProduct/products');
});

router.get('/search_result', async function (req, res){
    res.render('vwProduct/product_search_result', {
        layout: 'non_sidebar.hbs'
    });
});

router.post('/search_result', async function (req, res){
    const cateID = req.body.search_cateID;
    const param = req.body.search_param;
    const search_result = await productModel.searchProduct(cateID,param);
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
    if(product_info.buy_now_price == 0){
        delete product_info.buy_now_price;
    }
    if(product_info.not_sold == 0){
        delete product_info.not_sold;
    }
    moment.locale('vi');
    const end_date = moment(product_info.time_end, 'YYYY/MM/DD HH:mm:ss');
    if(end_date.diff(moment(), 'days') < 3){
        product_info.time_end = end_date.fromNow();
    }
    else{
        product_info.time_end = moment(product_info.time_end, 
                        'YYYY/MM/DD hh:mm:ss').format('DD/MM/YYYY HH:mm:ss');
    }
    
    product_info.time_start = moment(product_info.time_start, 
                        'YYYY/MM/DD HH:mm:ss').format('DD/MM/YYYY HH:mm:ss');
    
    var seller = await accountModel.findID(product_info.id_seller);
    const sellerVoteRatio = await accountModel.getUpVoteRatio(seller.id);
    // console.log(sellerVoteRatio);
    seller.des = sellerVoteRatio.des;
    const bidHistory = await productModel.getBidHistory(id_product);
    if(bidHistory !== null){
        for(let i = 0; i < bidHistory.length; i++){
            let bidderVoteRatio = await accountModel.getUpVoteRatio(bidHistory[i].bidder_id);
            bidHistory[i].ratio = bidderVoteRatio.ratio
            bidHistory[i].time = moment(bidHistory[i].time, 
                            'YYYY/MM/DD hh:mm:ss').format('DD/MM/YYYY HH:mm:ss');
        }
    }
    product_info.img = fileModel.getAllFileName('./public/img/products/' + id_product, id_product);
    var inWatchList = false;
    var canEdit = false;
    var ignored = false;
    var isHoldingPrice = false;
    var max_bid_price = 0;
    if(typeof(req.user) !== 'undefined'){
        inWatchList = await watchListModel.findObj({id_acc: req.user.id, id_product: id_product});
        if(inWatchList !== null){
            inWatchList = true;
        }
        if(req.user.id == seller.id){
            canEdit = true;
        }
        let isIgnored = await productModel.findIgnoredBidders({id_product: id_product, id_acc: req.user.id});
        if(isIgnored !== null){
            ignored = true;
        }
        if(product_info.id_win_bidder == req.user.id){
            isHoldingPrice = true;
            let holdingPriceBidder = await biddingModel.findByProductID(id_product);
            max_bid_price = holdingPriceBidder.max_bid_price;
        }

    }
    return res.render('vwProduct/product_detail',{
        layout: 'non_sidebar.hbs',
        id: id_product,
        product: product_info,
        seller: seller,
        bidHistory: bidHistory, 
        inWatchList: inWatchList,
        canEdit: canEdit,
        ignored: ignored,
        isHoldingPrice: isHoldingPrice,
        max_bid_price: max_bid_price});
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
    var max_bid_price = req.body.max_bid_price;
    const id_product = req.body.id_product;
    const id_acc = req.user.id;
    const product = await productModel.findID(id_product);
    const step_price = parseInt(product.step_price);
    max_bid_price = max_bid_price.split(' ')[1].replace(/,/g, '');
    max_bid_price = parseInt(max_bid_price);
    const price_hoding_bidder = await biddingModel.findByProductID(id_product);
    var newInPrice = 0;
    if(price_hoding_bidder !== null){
        if(price_hoding_bidder.max_bid_price < max_bid_price){
            await biddingModel.addNewAuction(id_acc,
                                id_product,
                                parseInt(price_hoding_bidder.max_bid_price) + 
                                parseInt(product.step_price));
            newInPrice = max_bid_price;
            await biddingModel.addNewPriceHoldingBidder(id_product, 
                                id_acc, newInPrice);
            await productModel.updatePriceHoldingBidder(id_product, id_acc);
        }
        else if(price_hoding_bidder.max_bid_price > max_bid_price){
            
            await biddingModel.addNewAuction(id_acc,
                            id_product,
                            max_bid_price);
            newInPrice = parseInt(max_bid_price) + 
                        parseInt(step_price);
            await biddingModel.addNewAuction(price_hoding_bidder.id_acc,
                                price_hoding_bidder.id_product,
                                newInPrice);
            
        }
        else{
            await biddingModel.addNewAuction(id_acc,
                                id_product,
                                max_bid_price - product.step_price);
            newInPrice = max_bid_price;
            await biddingModel.addNewAuction(price_hoding_bidder.id_acc,
                                    price_hoding_bidder.id_product,
                                    newInPrice);
        }
    }
    else{
        await biddingModel.addNewPriceHoldingBidder(id_product,
                            id_acc, max_bid_price);
        await biddingModel.addNewAuction(id_acc,
                                id_product,
                                product.price);
        await productModel.updatePriceHoldingBidder(id_product, id_acc);
        newInPrice = parseInt(product.price);
    }
    await productModel.updateInPrice(id_product, newInPrice);
    return res.redirect(req.headers.referer);
});

export default router;