import express from 'express';
import verifyEmailModel from '../models/mailing.OTP.model.js';
import accountModel from '../models/account.model.js';
import cryptoRandomString from 'crypto-random-string';

const router = express.Router();

function showMsgVerifyEmail(req, res, verified, msg, action){
	console.log(action);
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
		action: action,
		layout: 'non_sidebar.hbs'
	});
}

router.post('/resending-verify-email', async function(req, res){
	const id_acc = req.body.id_acc;
	const notVerified = await verifyEmailModel.find({id_acc: id_acc});
	if(notVerified === null){
		return res.redirect(req.headers.referer || '/');
	}
	const exprD = await verifyEmailModel.getNewExpiredDate();
	const host = req.headers.host;
	// console.log(exprD);

	const user = await accountModel.findID(id_acc);
	await verifyEmailModel.updateExprDate(id_acc, exprD);
	await verifyEmailModel.sendVerifyEmail(user.name, user.email, host,
				req.protocol + '://' + host, id_acc, notVerified.token, 24);
	return showMsgVerifyEmail(req, res, false, 'Đã gửi lại email xác nhận',
							'/mailing/resending-verify-email');
});

// router.get('/sending-verify-email', function(req, res){

// });

router.get('/verify-email', async function(req, res){
	// console.log(req.query.token);

	if(typeof (req.query.token) === 'undefined' || typeof (req.query.id_acc) === 'undefined'){
		// console.log('not Verified');
		return res.redirect(req.headers.referer || '/');
	}

	const id_acc = req.query.id_acc;
	const token = req.query.token;
	var info = await verifyEmailModel.find({id_acc: id_acc, token: token});
	// console.log(info);
	if(info === null){
		return res.redirect(req.headers.referer || '/');
	}
	const exprD = new Date(info.expired_date);
	const today = new Date();
	if(today > exprD){
		return showMsgVerifyEmail(req, res, false, 'Link xác nhận của bạn đã quá hạn',
								'/mailing/resending-verify-email');
	}

	await verifyEmailModel.delete(id_acc);
	showMsgVerifyEmail(req, res, true, 'Xác minh email thành công', 'javascript:;');
});

router.get('/forgot-password', async function(req, res){
	if(typeof (req.query.token) === 'undefined' || typeof (req.query.id_acc) === 'undefined'){
		// console.log('not Verified');
		return res.redirect(req.headers.referer || '/');
	}
	const id_acc = req.query.id_acc;
	const token = req.query.token;
	const info = await accountModel.findInForgotPwd({ id_acc: id_acc });
	if(info === null){
		return res.redirect(req.headers.referer || '/');
	}
	const exprD = new Date(info.expired_date);
	const today = new Date();
	if(today > exprD){
		return showMsgVerifyEmail(req, res, false, 'Link xác nhận của bạn đã quá hạn', 
								'/mailing/resending-forgot-password-email');
	}
	return res.render('vwAccount/resetPassword', {
		layout: 'non_sidebar.hbs',
		id_acc: id_acc,
		token: token,
		isChangePwd: false
	});
});

router.post('/resending-forgot-password-email', async function(req, res){
	const id_acc = req.body.id_acc;
	const forgotPwdUser = await accountModel.findInForgotPwd({id_acc: id_acc});
	const user = await accountModel.findID(id_acc);
	if(forgotPwdUser === null || user === null){
		return res.redirect(req.headers.referer || '/');
	}

	const token = cryptoRandomString({length: 100});
	const exprD = await verifyEmailModel.getNewExpiredDate();
	const host = req.headers.host;
	await accountModel.addToForgotPwd({id_acc: user.id, token: token, expired_date: exprD});
	// send mail change pwd
	await verifyEmailModel.sendForgotPwdEmail(user.name, user.email,
				host, req.protocol + '://' + host, user.id, token, 24)
	return showMsgVerifyEmail(req, res, false, 'Đã gửi lại email xác nhận',
							'/mailing/resending-forgot-password-email');
});

export default router;