import express from 'express';

const router = express.Router();

router.get('/', async function (req, res){
    res.render('vwProduct/products');
});

router.get('/detail', async function (req, res){
    res.render('vwProduct/product_detail',{
        layout: 'non_sidebar.hbs'});
});
export default router;