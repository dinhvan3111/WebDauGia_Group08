import express from 'express';
import categoryModel from '../models/category.model.js';

const router = express.Router();

router.get('/', async function (req, res){
	const list = await categoryModel.getAll();
	// console.log(list);
	res.render('vwCategory/index', {
		categories: list
	})
});

router.get('/:id', async function(req, res){

});

export default router;