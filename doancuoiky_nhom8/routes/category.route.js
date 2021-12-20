import express from 'express';
import categoryModel from '../models/category.model.js';
import checkPermission from "../middlewares/permission.mdw.js";
import productModel from "../models/product.model.js";
import moment from "moment";
import fileModel from "../models/upload.model.js";
const router = express.Router();

router.get('/', async function (req, res){
	const list = await categoryModel.getAllParent();
	var isAdmin = false;

	if(req.session.passport.user!==undefined) {
		if (req.session.passport.user.id_permission === 1) {
			isAdmin = true;

		}
	}
	res.render('vwCategory/index', {
		layout: 'non_sidebar.hbs',
		categories: list,
		isAdmin
	})
});
// router.get('/list-product/:id', async function (req, res){
// 	const cateID = req.params.id;
// 	console.log(cateID);
// 	const sort = req.body.sort || '0'; // 1 là theo thời gian kết thúc giảm dần, 2 là giá tăng dần, 0 là không sort
// 	const result = await categoryModel.getProductByIdCtg(cateID,sort);
// 	moment.locale('vi');
// 	var end_date = [];
// 	for (let i =0 ; i < result.length; i++){
// 		end_date.push(0);
// 	}
// 	for(let i =0 ; i < result.length; i++){
// 		if(result[i].buy_now_price == 0){
// 			delete result[i].buy_now_price;
// 		}
// 		end_date[i] = moment(result[i].time_end, 'YYYY/MM/DD HH:mm:ss');
// 		if(end_date[i].diff(moment(), 'days') < 3){
// 			result[i].price_color = false;
// 			result[i].time_end = end_date[i].fromNow();
// 		}
// 		else{
// 			result[i].price_color = true;
// 			result[i].time_end = moment(result[i].time_end,
// 				'YYYY/MM/DD hh:mm:ss').format('DD/MM/YYYY HH:mm:ss');
// 		}
// 		result[i].time_start = moment(result[i].time_start,
// 			'YYYY/MM/DD HH:mm:ss').format('DD/MM/YYYY HH:mm:ss');
// 		result[i].img = fileModel.getAllFileName('./public/img/products/' + result[i].id, result[i].id);
// 		result[i].bidHistory = await productModel.getBidHistory(result[i].id);
// 	}
// 	res.render('vwCategory/show-product', {
// 		// layout: 'non_sidebar.hbs',
// 		cateID,
// 		result
// 	});
// });
router.get('/add_category', checkPermission.isNotAdmin,async function (req,res){
	res.render('vwCategory/add_category',{
		layout:'non_sidebar.hbs'
	});
})
router.post('/add_category', async function (req,res){
	const category = await categoryModel.findByName(req.body.name);
	if(category!== null){
		res.render('vwCategory/add_category',{
			layout: 'non_sidebar.hbs',
			err_message: "Tên danh mục đã tồn tại!"
		});
	}
	else{
		const ret = await categoryModel.add(req.body);
		// console.log(ret);
		res.render('vwCategory/add_category',{
			layout: 'non_sidebar.hbs',
			success_message:"Thêm danh mục thành công!"
		});
	}

})
router.post('/del', async function (req, res) {
	console.log(req.body);
	const product = await categoryModel.findProductByIdCtg(req.body.id);
	const list = await categoryModel.getAllParent();
	const child = await categoryModel.getAllChildWithId(req.body.id);
	var isAdmin = false;
	if(req.session.passport.user!==undefined) {
		if (req.session.passport.user.id_permission === 1) {
			isAdmin = true;

		}
	}
	if(product !== null ||child[0]!==undefined ){
		res.render('vwCategory/index',{
			categories:list,
			isAdmin,
			err_del: "Không thể xóa danh mục có chứa sản phẩm!"
		})
	}
	else {
		const ret = await categoryModel.deleteById(req.body.id);
		res.redirect('/admin/categories');
	}
});
router.get('/edit', checkPermission.isNotAdmin,async function(req, res){
	const id = req.query.id || 0;
	const category = await categoryModel.findById(id);
	if (category === null) {
		return res.redirect('/admin/categories');
	}

	res.render('vwCategory/edit', {
		layout: 'non_sidebar.hbs',
		category
	});
});
router.post('/patch', async function (req, res) {
	const category = await categoryModel.findById(req.body.id);
	const new_category =await categoryModel.findByName(req.body.name);
	if(new_category !== null){
		res.render('vwCategory/edit', {
			layout: 'non_sidebar.hbs',
			category,
			err_message: "Thất bại! Tên danh mục đã được sử dụng!"
		});
	}
	else {
		const ret = await categoryModel.patch(req.body);
		res.redirect('/admin/categories');
	}
});
router.get('/childctg', async function(req, res){
	const id = req.query.id || 0;
	const list = await categoryModel.getAllChildWithId(id);
	var isAdmin = false;
	if(req.session.passport.user!==undefined) {
		if (req.session.passport.user.id_permission === 1) {
			isAdmin = true;
		}
	}
	res.render('vwCategory/childctg',{
		layout: 'non_sidebar.hbs',
		categories: list,
		isAdmin,
		parent_id: id
	})
});
router.get('/childctg/:id/add_category', checkPermission.isNotAdmin,async function (req,res){
	//console.log(req.params.id);
	const parent_id = req.params.id;
	res.render('vwCategory/add_childCategory',{
		layout:'non_sidebar.hbs',
		parent_id
	});
})
router.post('/childctg/:id/add_category', async function (req,res) {
	const category = await categoryModel.findByName(req.body.name);
	if (category !== null) {
		res.render('vwCategory/add_childCategory', {
			layout: 'non_sidebar.hbs',
			err_message: "Tên danh mục đã tồn tại!"
		});
	} else {
		const ret = await categoryModel.add(req.body);
		// console.log(ret);
		res.render('vwCategory/add_category', {
			layout: 'non_sidebar.hbs',
			success_message: "Thêm danh mục thành công!"
		});
	}
});
router.get('/childctg', async function(req, res){
	const id = req.query.id || 0;
	const list = await categoryModel.getAllChildWithId(id);
	var isAdmin = false;
	if(req.session.passport.user!==undefined) {
		if (req.session.passport.user.id_permission === 1) {
			isAdmin = true;
		}
	}
	res.render('vwCategory/childctg',{
		layout: 'non_sidebar.hbs',
		categories: list,
		isAdmin,
		parent_id: id
	})
});
router.get('/childctg/edit_category', checkPermission.isNotAdmin,async function (req,res){
	const id =  req.query.id||0;
	const category = await categoryModel.findById(id);
	const parent = await categoryModel.findById(category.parent_id);
	res.render('vwCategory/edit_childCategory',{
		layout:'non_sidebar.hbs',
		category,
		parent
	});
})
router.post('/childctg/edit_category', checkPermission.isNotAdmin,async function(req, res){
	console.log(req.body);
	const id = req.body.id;
	const parent_name = req.body.parent_name;
	const name = req.body.name;
	const old_category = await categoryModel.findById(id);
	const parent_category = await categoryModel.findByName(parent_name);
	const current_parent = await categoryModel.findById(old_category.parent_id);
	const category = await categoryModel.findByName(name);
	console.log(category);
	console.log(parent_category);
	console.log(current_parent);
	if(parent_category===null){
		return res.render('vwCategory/edit_childCategory', {
			layout: 'non_sidebar.hbs',
			category,
			parent:current_parent,
			err_message: "Thất bại! Tên danh mục cha Không tồn tại!"
		});
	}
	else if(parent_category!==null && parent_category.name !== current_parent.name){

		const new_category = {
			"id": id,
			"name": name,
			"parent_id":parent_category.id
		}
		const ret = await categoryModel.patch(new_category);
		return res.redirect('/admin/categories/childctg?id=' + current_parent.id);
	}
	else {
		if (category !== null && parent_category.name === current_parent.name) {
			return res.render('vwCategory/edit_childCategory', {
				category,
				parent: current_parent,
				err_message: "Thất bại! Tên danh mục đã được sử dụng!"
			});
		} else if (category === null && parent_category.name === current_parent.name) {
			const new_category = {
				"id": id,
				"name": name,
				"parent_id": current_parent.id
			}
			const ret = await categoryModel.patch(new_category);
			return res.redirect('/admin/categories/childctg?id=' + current_parent.id);
		}
	}
	// else {
	// 	console.log("vo 4");
	// 	const new_category = {
	// 		"id": id,
	// 		"name": name,
	// 		"parent_id":current_parent.id
	// 	}
	// 	const ret = await categoryModel.patch(new_category);
	// 	return res.redirect('/admin/categories/childctg?id=' + current_parent.id);
	// }
});
export default router;