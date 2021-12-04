import categoryRoute from '../routes/category.route.js';
import accountRoute from '../routes/account.route.js';

export default function(app){
	app.get('/', function (req, res) {
	    res.render('home');
	});

	app.get('/bs4', function (req, res) {
	    res.sendFile( __dirname + '/bs4.html');
	})

	app.use('/admin/categories', categoryRoute);
	app.use('/', accountRoute);





	app.get('/err', function(req, res){
	    throw new Error('Error');
	});
	app.use(function (req, res, next){
	    res.render('404', {layout: false});
	});

	app.use(function (err, req, res, next){
	    res.render('500', {layout: false});
	});
}