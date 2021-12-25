import accountModel from '../models/account.model.js';

export default function(app){
	app.use(async function (req, res, next){
		if(typeof(req.user) !== 'undefined'){
			const user = await accountModel.findID(req.user.id);
			if(user.is_locked == 1){
				return res.render('vwAccount/locked_acc.hbs', {
					email: 'grouptest20@student.hcmus.edu.vn',
					layout: false
				})
			}
		}
		next();
	});
}