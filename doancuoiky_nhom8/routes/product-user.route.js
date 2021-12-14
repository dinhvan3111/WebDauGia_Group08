import express from 'express';
import moment from 'moment';
import productModel from '../models/product.model.js';
import accountModel from '../models/account.model.js';
import fileModel from '../models/upload.model.js';

const router = express.Router();

router.get('/', async function (req, res){
    res.render('vwProduct/products');
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
    // console.log(bidHistory);
    return res.render('vwProduct/product_detail',{
        layout: 'non_sidebar.hbs',
        id: id_product,
        product: product_info,
        seller: seller,
        bidHistory: bidHistory});
});
export default router;