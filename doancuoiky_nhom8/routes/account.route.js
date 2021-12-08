import express from 'express';
import accountModel from '../models/account.model.js';
import fetch from 'node-fetch';
import bcrypt from 'bcrypt';
import moment from 'moment';
import cryptoRandomString from 'crypto-random-string';
import envVar from '../utils/envVar.js';
import mailingModel from '../models/mailing.model.js';

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
	const newUsr = await accountModel.findEmail(email);
	var newId = newUsr.id;
	console.log(newId);
	const token = cryptoRandomString({length: 100});
	
	var exprD = await mailingModel.getNewExpiredDate();
	await accountModel.addToNotVerifiedEmail({id_acc: newId, token: token, expired_date: exprD});

	const host = req.headers.host;
	await mailingModel.sendVerifyEmail(name, email, host, req.protocol + '://' + host, newId, token, 24);

	req.session.idAcc = newId;
	return res.json({"success": true, "msg": "Đăng kí thành công"});
});

router.get('/login', isLogon, function(req, res){
	var loginFailed = false;
	var provider = '';
	if(typeof(req.session.loginInfo) !== 'undefined'){
		loginFailed = req.session.loginInfo.isLogging;
		provider = req.session.loginInfo.provider;
		delete req.session.loginInfo;
	}
	res.render('vwAccount/login', {layout: false, loginFailed: loginFailed, provider: provider});
});
router.post('/login', async function (req, res) {
	if(req.body.password.length < 8){
		return res.render('vwAccount/login',{
			layout: false,
			username: req.body.username,
			err_message: "Mật khẩu phải trên 8 kí tự"
		})
	}
	const user = await accountModel.findUsername(req.body.username);
	if(user === null){
		return res.render('vwAccount/login',{
			layout: false,
			err_message: "Tài khoản hoặc mật khẩu không chính xác!"
		})
	}
	const ret = bcrypt.compareSync(req.body.password,user.pwd);
	console.log(ret);
	if(ret === false){
		return res.render('vwAccount/login',{
			layout: false,
			err_message: "Tài khoản hoặc mật khẩu không chính xác!"
		})
	}
	console.log(user);
	req.session.passport.user = user;
	const url = '/';
	res.redirect(url);
});
router.get('/profile', notLogin, function(req, res){
	res.render('vwAccount/profile');
});

router.post('/logout', function(req, res){
	if(typeof(req.session.idAcc) !== 'undefined'){
      	delete req.session.idAcc;
    }
    req.logout();
    const url = req.headers.referer || '/';
    res.redirect(url);
});


export default router;