import express from 'express';
import categoryModel from '../models/category.model.js';

const router = express.Router();

router.get('/', async function (req, res){
	const list = await categoryModel.getAllParent();
	res.render('vwCategory/index', {
		categories: list
	})
});

// router.get('/:id', async function(req, res){
//
// });

router.get('/childctg', async function(req, res){
	const id = req.query.id || 0;
	const list = await categoryModel.getAllChildWithId(id);
	res.render('vwCategory/childctg',{
		categories: list,
	})
});

export default router;