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
    const info = await productModel.getProductDetail(req, product_info, id_product);
    
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
        startDate: info.startDate});
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

export default router;