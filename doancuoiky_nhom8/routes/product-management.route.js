import express from 'express';
import envVar from '../utils/envVar.js';
import upload from '../models/upload.model.js';
import accountModel from '../models/account.model.js';
import productModel from '../models/product.model.js';
import cateModel from '../models/category.model.js';
import biddingModel from '../models/bidding.model.js';
import checkPermission from '../middlewares/permission.mdw.js';
import moment from 'moment';
import numeral from 'numeral';
import mailing from '../models/mailing.transaction.model.js';
import pagingInfo from '../utils/paging.helper.js';


const router = express.Router();

router.get('/add', checkPermission.isNotSeller, async function(req, res){
	// console.log(upload.getAllFileName('./public/img/products/2'));
	// console.log('line 11');
	const cate = await cateModel.getAllChildCate();
	return res.render('vwProduct/add_product', {
		layout: 'non_sidebar.hbs',
		cate: cate,
		TINY_CLOUD_API: envVar.TINY_CLOUD_API});
});

router.post('/add', async function(req, res){
	var id = await productModel.getLastID();
	if(id === null){
		id = 1;
	} else {
		id = parseInt(id) + 1;
	}
	const path = './public/img/products/' + id;
	const success = await upload.uploadImg(path, [
		  	{ name: 'imgThumbnail', maxCount: 1 },
		  	{ name: 'imgsExta', maxCount: 5 }], req, res);
	if(success === true){
		await productModel.createNewProduct(req, id, req.user.id);
		const cate = await cateModel.getAllChildCate();
		res.render('vwProduct/add_product', {
			layout: 'non_sidebar.hbs',
			cate: cate,
			msg: 'Đã đăng sản phẩm thành công',
			TINY_CLOUD_API: envVar.TINY_CLOUD_API});
	}
	else{
		const cate = await cateModel.getAllChildCate();
		upload.deletePath(path);
		// console.log(cate);
		res.render('vwProduct/add_product', {
			layout: 'non_sidebar.hbs',
			msg: 'Không thể upload ảnh lên, vui lòng thử lại sau giây lát',
			product: req.body,
			cate: cate,
			TINY_CLOUD_API: envVar.TINY_CLOUD_API});
	}
});

router.get('/appendDes', checkPermission.isNotSeller, async function(req, res){
	const id = req.query.id || 0;
	const product = await productModel.findID(id);
	res.render('vwProduct/append_description',{
		id,
		name: product.name,
		TINY_CLOUD_API: envVar.TINY_CLOUD_API,
		layout: 'non_sidebar.hbs'
	});
});

router.post('/appendDes', checkPermission.isNotSeller, async function(req, res){
	const id = req.body.id;
	const appendDes = req.body.description;
	await productModel.appendDescription(id,appendDes);
	res.redirect('/products/' + id);
});

router.post('/:product_id/ignore', checkPermission.isNotSeller, 
				async function(req, res){
	const bidder_id = req.body.id_bidder;
	const product = await productModel.findID(req.params.product_id);
	const bidder = await accountModel.findID(bidder_id);
	if(product !== null && bidder !== null){
		await productModel.ignoreBidder(product, bidder, 
							req.protocol + '://' + req.headers.host);
	}

	res.redirect(req.headers.referer);
});
router.get('/management', checkPermission.isNotAdmin, async function(req, res){
	const catID = req.query.id || 0;
	const limit = 10;
	const page = req.query.page || 1;
	const offset = (page -1) * limit;
	var total;
	if(catID === 0){
		total = await productModel.countPageByAll();
	}
	else{
		total = await productModel.countPageByIdCtg(catID);
	}
	const paging = pagingInfo.getPagingInfo(limit, page, total);
	const list_product = await productModel.getListProductToManage(catID, limit, offset);
	var choseCtg = "Tất cả";
	if(catID !==0){
		choseCtg = await cateModel.findById(catID);
		choseCtg = choseCtg.name;
	}
	var categories = await cateModel.getAllCtg();
	var chillCtg = [];
	for(var i = 0; i<categories.length; i++ ){
		if(categories[i].parent_id !== null){
			chillCtg.push(categories[i])
		}
	}
	categories = chillCtg;
	console.log(categories);
	for(var i = 0;i <list_product.length; i++){
		list_product[i].start = moment(list_product[i].start).format('HH:mm DD-MM-YYYY')
		list_product[i].end = moment(list_product[i].end).format('HH:mm DD-MM-YYYY');
	}
	res.render('vwProduct/product_management',{
				page,
                nextPage: paging.nextPage, 
                prePage: paging.prePage, 
                disableNext: paging.disableNext, 
                disablePre: paging.disablePre,
                pageNumber: paging.pageNumber,
				totalPage: paging.totalPage,
				list_product,
				layout:'non_sidebar.hbs',
				categories,
				choseCtg
	})
});
router.post('/del', checkPermission.isNotAdmin,
						async function(req, res){
	const id = req.body.proID;
	// console.log(id);
	const product = await productModel.findID(id);
	if(product !== null){
		if(product.id_win_bidder !== null && product.not_sold == 1){
			const bidder = await accountModel.findID(product.id_win_bidder);
			await mailing.deletedProduct_sendBidder(bidder.email, 
					bidder.name, 
					product.name, 
					numeral(product.price).format('0,0'));
		}


		const seller = await accountModel.findID(product.id_seller);

		await biddingModel.deleteBidderBidsOfProduct(id);
		await productModel.deleteWatchListByProID(id);
		await productModel.deleteBidHistoryByProID(id);
		await productModel.deleteRateHistoryByProID(id);
		await productModel.deleteProduct(id);
		await upload.deletePath('./public/img/products/' + product.id);
		await mailing.deletedProduct_sendSeller(seller.email, 
												seller.name,
												product.name);
	}
	


	res.redirect(req.headers.referer);
});


export default router;