import checkVerifiedEmail from '../models/mailing.OTP.model.js';

async function notVerifiedEmail(id_acc){
	return await checkVerifiedEmail.find({id_acc: id_acc});
};

export default function (app){
	app.use(async function (req, res, next){
		if(typeof(req.user) !== 'undefined'){
			if(req.user.email === null){
				return res.redirect('/mailing/enter-your-email');
			}
			else if(await notVerifiedEmail(req.user.id) !== null){
				return res.redirect('/mailing/enter-your-email');
			}
		}
		next();
	});
}