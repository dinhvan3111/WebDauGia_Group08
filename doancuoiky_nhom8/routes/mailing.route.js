import express from 'express';
import mailingModel from '../models/mailing.model.js';
import accountModel from '../models/account.model.js';

const router = express.Router();

function showMsg(req, res, verified, msg){
	var isLogon = true;
	if(typeof (req.user) === 'undefined'){
		isLogon = false;
	}
	if(typeof(req.session.idAcc) !== 'undefined'){
      	delete req.session.idAcc;
    }
	// console.log(req.session.passport);
	res.render('vwAccount/verifyEmail', {
		msg: msg, 
		isLogon: isLogon,
		id_acc: req.query.id_acc,
		verified: verified,
		layout: 'non_sidebar.hbs'
	});
}

router.post('/resending-verify-email', async function(req, res){
	const id_acc = req.body.id_acc;
	const notVerified = await mailingModel.find({id_acc: id_acc});
	if(notVerified === null){
		return res.redirect(req.headers.referer);
	}
	const exprD = await mailingModel.getNewExpiredDate();
	const host = req.headers.host;
	// console.log(exprD);

	const user = await accountModel.findID(id_acc);
	await mailingModel.updateExprDate(id_acc, exprD);
	await mailingModel.sendVerifyEmail(user.name, user.email, host,
				req.protocol + '://' + host, id_acc, notVerified.token, 24);
	return showMsg(req, res, false, 'Đã gửi lại email xác nhận');
});

router.get('/sending-verify-email', function(req, res){

});

// router.post('/verify-email', function(req, res){

// });

router.get('/verify-email', async function(req, res){
	// console.log(req.query.token);

	if(typeof (req.query.token) === 'undefined' || typeof (req.query.id_acc) === 'undefined'){
		// console.log('not Verified');
		return res.redirect(req.headers.referer || '/');
	}

	const id_acc = req.query.id_acc;
	const token = req.query.token;
	var info = await mailingModel.find({id_acc: id_acc, token: token});
	// console.log(info);
	if(info === null){
		return res.redirect(req.headers.referer || '/');
	}
	const exprD = new Date(info.expired_date);
	const today = new Date();
	if(today > exprD){
		return showMsg(req, res, false, 'Link xác nhận của bạn đã quá hạn');
	}

	await mailingModel.delete(id_acc);
	showMsg(req, res, true, 'Xác minh email thành công');
});

export default router;