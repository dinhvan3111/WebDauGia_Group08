import accountModel from '../models/account.model.js';

function isLogon(req, res){
	if(typeof (req.user) !== 'undefined'){
		const url = '/';
		return res.redirect(url);
	}
	
}

function notLogin(req, res){
	if(typeof (req.user) === 'undefined'){
		req.session.retUrl = req.originalUrl;
		const url = '/login';
		return res.redirect(url);
	}
}

export default {
	isLogon(req, res, next){
		isLogon(req, res);
		next();
	},

	notLogin(req, res, next){
		notLogin(req, res, next);
		next();
	},
	async isNotSeller(req, res, next){
		notLogin(req, res);
		const user = await accountModel.findID(req.user.id);
		// console.log(user);
		if(user.id_permission > 2){
			return res.render('404', {layout: false});
		}
		next();
	}
}