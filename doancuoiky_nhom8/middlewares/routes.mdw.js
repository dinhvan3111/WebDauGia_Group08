import productModel from '../models/product.model.js';
import categoryRoute from '../routes/category.route.js';
import accountRoute from '../routes/account.route.js';
import productUserRoute from '../routes/product-user.route.js';
import authRoute from '../routes/auth.route.js';
import mailingRoute from '../routes/mailing.route.js';
import productManagementRoute from '../routes/product-management.route.js';
import adminManagementRoute from '../routes/admin_management.route.js';

export default function(app){
	app.get('/', async function (req, res) {
		const productList = await productModel.getTopProduct();
		// console.log(productList);
	    res.render('home', {
	    	products: productList
	    });
	});

	app.get('/bs4', function (req, res) {
	    res.sendFile( __dirname + '/bs4.html');
	})


	app.use('/', authRoute);
	app.use('/admin/categories', categoryRoute);
	app.use('/', accountRoute);
	app.use('/products',productUserRoute);
	app.use('/products', productManagementRoute);
	app.use('/mailing', mailingRoute);
	app.use('/admin', adminManagementRoute);



	app.get('/err', function(req, res){
	    throw new Error('Error');
	});
	app.use(function (req, res, next){
	    res.render('404', {layout: false});
	});

	app.use(function (err, req, res, next){
	    res.render('500', {layout: false});
	    console.log(err);
	});
}