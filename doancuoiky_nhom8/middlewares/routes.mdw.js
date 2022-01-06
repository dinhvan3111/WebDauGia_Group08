import productModel from '../models/product.model.js';
import watchListModel from '../models/watchlist.model.js';
import categoryRoute from '../routes/category.route.js';
import accountRoute from '../routes/account.route.js';
import productUserRoute from '../routes/product-user.route.js';
import authRoute from '../routes/auth.route.js';
import mailingRoute from '../routes/mailing.route.js';
import productManagementRoute from '../routes/product-management.route.js';
import adminManagementRoute from '../routes/admin_management.route.js';
import checkVerifiedEmail from './verifiedEmail.mdw.js';
import adminManagement from "../models/admin_management.model.js";
import checkLockedAccMdw from './lockedAcc.mdw.js';
import moment from 'moment';
export default function(app){

	app.post('/logout', function(req, res){
		if(typeof(req.session.idAcc) !== 'undefined'){
	      	delete req.session.idAcc;
	    }
	    req.logout();
	    // const url = req.headers.referer || '/';
		res.redirect('/login');
	});

	app.use('/mailing', mailingRoute);
	
	checkVerifiedEmail(app);

	checkLockedAccMdw(app);

	app.get('/', async function (req, res) {
		const productList = await productModel.getTopProduct();
		var id = null;
		if(req.session.passport!== undefined){
			if(req.session.passport.user !== undefined){
				id = req.session.passport.user.id ;
			}
		};
		if(productList.nearTimeEnd === null){
			productList.nearTimeEnd = [];
		}
		if(productList.mostBid === null){
			productList.mostBid = [];
		}
		if(productList.highestPrice === null){
			productList.highestPrice = [];
		}
		for(var i = 0; i<productList.nearTimeEnd.length; i++){
			productList.nearTimeEnd[i].isWatchList = false;
			productList.nearTimeEnd[i].time_start = moment(productList.nearTimeEnd[i].time_start).format('DD/MM/YYYY  HH:mm:ss');
			productList.nearTimeEnd[i].time_end = moment(productList.nearTimeEnd[i].time_end).format('DD/MM/YYYY  HH:mm:ss');

			const checkInWatchList = await watchListModel.findById(id,productList.nearTimeEnd[i].id);
			if(checkInWatchList !== null){
				productList.nearTimeEnd[i].isWatchList = true;
			}
			productList.nearTimeEnd[i].isNew = productModel.isNew(productList.nearTimeEnd[i].real_time_start);
		}
		for(var i = 0; i<productList.mostBid.length; i++){
			productList.mostBid[i].isWatchList = false;
			productList.mostBid[i].time_start = moment(productList.mostBid[i].time_start).format('DD/MM/YYYY  HH:mm:ss');
			productList.mostBid[i].time_end = moment(productList.mostBid[i].time_end).format('DD/MM/YYYY  HH:mm:ss');

			const checkInWatchList = await watchListModel.findById(id,productList.mostBid[i].id);
			if(checkInWatchList !== null){
				productList.mostBid[i].isWatchList = true;
			}
			productList.mostBid[i].isNew = productModel.isNew(productList.mostBid[i].real_time_start);
		}
		for(var i = 0; i<productList.highestPrice.length; i++){
			productList.highestPrice[i].isWatchList = false;
			productList.highestPrice[i].time_start = moment(productList.highestPrice[i].time_start).format('DD/MM/YYYY  HH:mm:ss');
			productList.highestPrice[i].time_end = moment(productList.highestPrice[i].time_end).format('DD/MM/YYYY  HH:mm:ss');
			const checkInWatchList = await watchListModel.findById(id,productList.highestPrice[i].id);
			if(checkInWatchList !== null){
				productList.highestPrice[i].isWatchList = true;
			}
			productList.highestPrice[i].isNew = productModel.isNew(productList.highestPrice[i].real_time_start);
		}
	    return res.render('home', {
	    	products: productList
	    });
	    
	});

	app.use('/', authRoute);
	app.use('/', accountRoute);
	
	
	app.use('/admin/categories', categoryRoute);
	app.use('/products',productUserRoute);
	app.use('/products', productManagementRoute);
	app.use('/admin', adminManagementRoute);
	app.get('/about-us', function(req, res){
		return res.render('aboutUs', {
			layout: 'non_sidebar.hbs'
		})
	});


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