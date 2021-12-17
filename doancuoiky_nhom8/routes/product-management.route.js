import express from 'express';
import envVar from '../utils/envVar.js';
import upload from '../models/upload.model.js';
import productModel from '../models/product.model.js';
import cateModel from '../models/category.model.js';
import checkPermission from '../middlewares/permission.mdw.js';

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

export default router;