import express from 'express';
import accountModel from '../models/account.model.js';
import fetch from 'node-fetch';
import bcrypt from 'bcrypt';
import moment from 'moment';
import envVar from '../utils/envVar.js';

const router = express.Router();

function isLogon(req, res, next){
	if(typeof (req.user) !== 'undefined'){
		const url = '/';
		return res.redirect(url);
	}
	next();
};

function notLogin(req, res, next){
	if(typeof (req.user) === 'undefined'){
		req.session.retUrl = req.originalUrl;
		const url = '/login';
		return res.redirect(url);
	}
	next();
};

router.get('/register', isLogon, function(req, res){
	res.render('vwAccount/register');
});

router.post('/register', isLogon, async function(req, res){
	const username = req.body.user;
	const isNull = await accountModel.findUsername(username);
	if(isNull !== null){
		return res.json({"success": false, "msg": "Tên tài khoản này đã tồn tại. Vui lòng chọn tên khác"});
	}

	const email = req.body.email;
	const isEmailValid = await accountModel.findEmail(email);
	if(isEmailValid !== null){
		return res.json({"success": false, "msg": "Email này đã dùng để đăng kí cho một tài khoản. Vui lòng chọn email khác"});
	}

	const secretKey = envVar.CAPTCHA_PRIVATE_KEY;
	const verifyCaptcha = `https://www.google.com/recaptcha/api/siteverify?secret=${secretKey}&response=${req.body.captcha}&remoteip=${req.connection.remoteAddress}`;
	const verified = await fetch(verifyCaptcha, {method: "POST"})
		.then(_res => _res.json());
	if(verified.success === false){
		return res.json({"success": false, "msg": "Lỗi xác minh reCaptcha. Vui lòng thử lại sau"});
	}

	const pwd = req.body.pwd;
	const name = req.body.name;
	const addr = req.body.addr;
	const dob = moment(req.body.dob, 'DD/MM/YYYY').format('YYYY-MM-DD');

	const salt = bcrypt.genSaltSync(10);
	const hashedPwd = bcrypt.hashSync(pwd, salt);

	const usrObj = {
		username: username, 
		pwd: hashedPwd,
		name: name, 
		email: email, 
		dob: dob, 
		addr: addr
	};

	await accountModel.createAcc(usrObj);

	return res.json({"success": true, "msg": "Đăng kí thành công"});
});

router.get('/login', isLogon, function(req, res){
	res.render('vwAccount/login', {layout: false});
});

router.get('/profile', notLogin, function(req, res){
	res.render('vwAccount/profile');
});

router.post('/logout', function(req, res){
    req.logout();
    const url = req.headers.referer || '/';
    res.redirect(url);
});


export default router;