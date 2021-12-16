import accountModel from '../models/account.model.js';

function isLogon(req, res){
	if(typeof (req.user) !== 'undefined'){
		const url = '/';
		res.redirect(url);
		return true;
	}
	return false;
}

function notLogin(req, res){
	if(typeof (req.user) === 'undefined'){
		req.session.retUrl = req.originalUrl;
		const url = '/login';
		res.redirect(url);
		return true;
	}
	return false;
}

export default {
	isLogon(req, res, next){
		if(isLogon(req, res) !== true){
			next();
		}
	},

	notLogin(req, res, next){
		if(notLogin(req, res) !== true){
			next();
		}
	},
	async isNotSeller(req, res, next){
		if(notLogin(req, res) !== true){
			notLogin(req, res);
			const user = await accountModel.findID(req.user.id);
			// console.log(user);
			if(user.id_permission > 2){
				return res.render('404', {layout: false});
			}
			next();
		}
	}
}