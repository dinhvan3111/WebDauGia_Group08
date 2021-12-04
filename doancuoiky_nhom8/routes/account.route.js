import express from 'express';
import accountModel from '../models/account.model.js';
import fetch from 'node-fetch';
import bcrypt from 'bcrypt';
import moment from 'moment';

const router = express.Router();

router.get('/register', function(req, res){
	res.render('vwAccount/register');
});

router.post('/register', async function(req, res){
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

	const secretKey = '6LeVB3gdAAAAAO5OCdQX_auMA3uM7TI6bhNBab_Q';
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

	await accountModel.createAcc(username, hashedPwd, name, email, dob, addr);

	return res.json({"success": true, "msg": "Đăng kí thành công"});
});

// router.get('/login', function(req, res){
// 	res.render('vwAccount/login');
// });

// router.get('/profile', function(req, res){
// 	res.render('vwAccount/profile');
// });

export default router;