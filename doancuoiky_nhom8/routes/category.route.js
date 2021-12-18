import express from 'express';
import categoryModel from '../models/category.model.js';
import checkPermission from "../middlewares/permission.mdw.js";
const router = express.Router();

router.get('/', async function (req, res){
	const list = await categoryModel.getAllParent();
	var isAdmin = false;
	const ImAdmin = true;

	if(req.session.passport.user!==undefined) {
		if (req.session.passport.user.id_permission < 3) {
			isAdmin = true;

		}
	}
	res.render('vwCategory/index', {
		categories: list,
		isAdmin
	})
});

router.get('/add_category', checkPermission.isNotSeller,async function (req,res){
	res.render('vwCategory/add_category',{
		// layout:'non_sidebar.hbs'
	});
})
router.post('/add_category', async function (req,res){
	console.log(req.body);
	const category = await categoryModel.findByName(req.body.name);
	console.log(category);
	if(category!== null){
		res.render('vwCategory/add_category',{
			err_message: "Tên danh mục đã tồn tại!"
		});
	}
	else{
		const ret = await categoryModel.add(req.body);
		// console.log(ret);
		res.render('vwCategory/add_category',{
			success_message:"Thêm danh mục thành công!"
		});
	}

})
router.post('/del', async function (req, res) {
	console.log(req.body);
	const ret = await categoryModel.deleteById(req.body.id);
	res.redirect('/admin/categories');
});
router.get('/edit', checkPermission.isNotSeller,async function(req, res){
	const id = req.query.id || 0;
	const category = await categoryModel.findById(id);
	if (category === null) {
		return res.redirect('/admin/categories');
	}

	res.render('vwCategory/edit', {
		category
	});
});
router.post('/patch', async function (req, res) {
	const category = await categoryModel.findById(req.body.id);
	const new_category =await categoryModel.findByName(req.body.name);
	console.log(new_category);
	if(new_category !== null){
		res.render('vwCategory/edit', {
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
		if (req.session.passport.user.id_permission < 3) {
			isAdmin = true;
		}
	}
	res.render('vwCategory/childctg',{
		categories: list,
		isAdmin
	})
});

export default router;