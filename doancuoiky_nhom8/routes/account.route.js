import express from 'express';
import accountModel from '../models/account.model.js';
import fetch from 'node-fetch';
import bcrypt from 'bcrypt';
import moment from 'moment';
import cryptoRandomString from 'crypto-random-string';
import envVar from '../utils/envVar.js';
import mailingModel from '../models/mailing.OTP.model.js';
import acceptRequestModel from '../models/admin_management.model.js';
import rateModel from '../models/rate.model.js';
import checkPermission from '../middlewares/permission.mdw.js';

const router = express.Router();


router.get('/register', checkPermission.isLogon, function(req, res){
	res.render('vwAccount/register');
});

router.post('/register', checkPermission.isLogon, async function(req, res){
	const username = req.body.username;

	const isNull = await accountModel.findUsername(username);
	if(isNull !== null){
		return res.render('vwAccount/register', {
			user: {
				username: req.body.user,
				name: req.body.name,
				addr: req.body.addr,
				email: req.body.email,
				dob: req.body.dob,
				msg: 'Tên tài khoản này đã tồn tại. Vui lòng chọn tên khác'
			}
		});
	}

	const email = req.body.email;
	const isEmailValid = await accountModel.findEmail(email);
	if(isEmailValid !== null){
		return res.render('vwAccount/register', {
			user: {
				username: req.body.user,
				name: req.body.name,
				addr: req.body.addr,
				email: req.body.email,
				dob: req.body.dob,
				msg: 'Email này đã dùng để đăng kí cho một tài khoản. Vui lòng chọn email khác'
			}
		});
	}
	const captcha = req.body['g-recaptcha-response'];
	const secretKey = envVar.CAPTCHA_PRIVATE_KEY;
	const verifyCaptcha = `https://www.google.com/recaptcha/api/siteverify?secret=${secretKey}&response=${captcha}&remoteip=${req.connection.remoteAddress}`;
	const verified = await fetch(verifyCaptcha, {method: "POST"})
		.then(_res => _res.json());
	if(verified.success === false){
		console.log(captcha);
		return res.render('vwAccount/register', {
			user: {
				username: req.body.user,
				name: req.body.name,
				addr: req.body.addr,
				email: req.body.email,
				dob: req.body.dob,
				msg: 'Lỗi xác minh reCaptcha. Vui lòng thử lại sau'
			}
		});
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
	// console.log(newId);
	const token = cryptoRandomString({length: 100});

	var exprD = await mailingModel.getNewExpiredDate();
	await accountModel.addToNotVerifiedEmail({id_acc: newId, token: token, expired_date: exprD});

	const host = req.headers.host;
	await mailingModel.sendVerifyEmail(name, email, host, req.protocol + '://' + host, newId, token, 24);

	req.session.idAcc = newId;
	return res.redirect('/login');
});

router.get('/login', checkPermission.isLogon, function(req, res){
	const from = req.query.from;
	if(typeof(from) != 'undefined'){
		req.session.retUrl = '/' + from.substr(1, from.length - 2);
		console.log(req.session.retUrl);
	}
	if(typeof(req.session.forgotPwd) !== 'undefined' &&
		req.session.forgotPwd === true){
		delete req.session.forgotPwd;
		return res.render('vwAccount/login', {layout: false, err_message: 'Đổi mật khẩu thành công'});
	}

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
			err_message: "Tài khoản hoặc mật khẩu không chính xác!"
		})
	}
	const user = await accountModel.findUsername(req.body.username);
	if(user === null){
		return res.render('vwAccount/login',{
			layout: false,
			username: req.body.username,
			err_message: "Tài khoản hoặc mật khẩu không chính xác!"
		})
	}
	const ret = bcrypt.compareSync(req.body.password,user.pwd);
	console.log(ret);
	if(ret === false){
		return res.render('vwAccount/login',{
			layout: false,
			username: req.body.username,
			err_message: "Tài khoản hoặc mật khẩu không chính xác!"
		})
	}
	if(user.is_locked == 1){
		return res.render('vwAccount/login',{
			layout: false,
			username: req.body.username,
			err_message: "Tài khoản của bạn đã bị khoá"
		})
	}
	delete user.pwd;
	user.dob = moment(user.dob, 'DD/MM/YYYY').format('DD-MM-YYYY');
	// console.log(user);
	req.user = user;
	req.session.passport = {user: user};
	const url = req.session.retUrl || '/';
	if(typeof(req.session.retUrl) !== 'undefined'){
		delete req.session.retUrl;
	}
	res.redirect(url);
});
router.get('/profile', checkPermission.notLogin, async function(req, res){
	const user = await accountModel.findID(req.user.id);
	const isBidder = (user.id_permission === 3) ? false : true;
	user.dob = moment(user.dob).format('DD-MM-YYYY');
	const userRatio = await accountModel.getUpVoteRatio(user.id);
	user.total_rate = userRatio.total_rate;
	user.starPercentage = await accountModel.starPercentage(userRatio.ratio);
	user.starPercentageRounded = await accountModel.starPercentageRounded(userRatio.ratio);
	console.log(user);
	res.render('vwAccount/profile',{
		layout: 'non_sidebar.hbs',
		isBidder,
		user: user,
		manage: true
	});
});
router.post('/profile', checkPermission.notLogin, async function(req, res){
	const id_acc = req.body.id_acc;
	const check = await acceptRequestModel.addRequest(id_acc);
	var message;
	if(check === 1){
		message = 'Gửi yêu cầu thành công';
	}
	else if(check === 0){
		message = 'Bạn đã là seller';
	}
	else{
		message = 'Yêu cầu của bạn đang trong hàng đợi';
	}
	const user = await accountModel.findID(req.user.id);
	user.dob = moment(user.dob).format('DD-MM-YYYY');
	const userRatio = await accountModel.getUpVoteRatio(user.id);
	user.starPercentage = await accountModel.starPercentage(userRatio.ratio);

	res.render('vwAccount/profile',{
		layout: 'non_sidebar.hbs',
		user: user,
		message,
		manage: true
	});
});
router.get('/profile/:id', async function(req, res, next){
	const id = req.params.id;
	const user = await accountModel.findID(id);
	const userRatio = await accountModel.getUpVoteRatio(user.id);
	user.starPercentage = await accountModel.starPercentage(userRatio.ratio);
	user.starPercentageRounded = await accountModel.starPercentageRounded(userRatio.ratio);
	if(user !== null){
		if(typeof(req.user) !== 'undefined'){
			if(user.id === req.user.id){
				return res.redirect('/profile');
			}
		}
		const user_info = {
			id: id,
			username: user.username,
			name: user.name,
			email: user.email,
			dob: moment(user.dob, 'YYYY/MM/DD').format('DD-MM-YYYY'),
			addr: user.addr,
			starPercentage: user.starPercentage,
			starPercentageRounded: user.starPercentageRounded,
		}
		return res.render('vwAccount/profile',{
			layout: 'non_sidebar.hbs',
			user: user_info
		});
	}
	next();
});
router.get('/rating/:id', async function(req, res){
	const id = req.params.id;
	const rate_history = await rateModel.findByID(id);
	const user = await accountModel.findID(id);
	// if(rate_history === null){
	// 	res.redirect("/404");
	// }
	// else{
		const rateHistoryAndProduct = await rateModel.getDetailRate(id);
		for(var i = 0; i<rateHistoryAndProduct.length;i++){
			if(rateHistoryAndProduct[i].mark == 1 ){
				rateHistoryAndProduct[i].mark = true;
			}
			else {
				rateHistoryAndProduct[i].mark = false;
			}
		}
		console.log(rateHistoryAndProduct)
		res.render('vwAccount/rating',{
			layout: 'non_sidebar.hbs',
			rate:rateHistoryAndProduct,
			fullName:user.name,
			id_acc: id
		});
	// }
});
// router.get('/edit_profile', checkPermission.notLogin, async function(req, res){
//
// 	res.render('vwAccount/edit_profile',{
// 		layout: 'non_sidebar.hbs',
// 		id_acc: req.session.passport.user.id
// 	});
// });
router.get('/edit_profile', checkPermission.notLogin, async function(req, res){
	const user = await accountModel.findID(req.session.passport.user.id);
	user.dob = moment(user.dob).format('DD-MM-YYYY');
	console.log(user.dob);

	res.render('vwAccount/edit_profile',{
		layout: 'non_sidebar.hbs',
		user: user
	});


});
router.post('/edit_profile', checkPermission.notLogin, async function(req, res){
	console.log(req.body)
	const name = req.body.name;
	const username = req.body.username;
	const email = req.body.email;
	const addr = req.body.addr;
	const dob = moment(req.body.dob, 'DD/MM/YYYY').format('YYYY-MM-DD');

	const id_acc = req.body.id_acc;
	const user = await accountModel.findID(id_acc);
	user.dob = moment(user.dob).format('DD-MM-YYYY');
	if(name !== req.session.passport.user.name){

		await accountModel.updateName(name, id_acc);
		req.session.passport.user.name = name;
	}
	if(addr !== req.session.passport.user.addr){
		await accountModel.updateAddr(addr, id_acc);
		req.session.passport.user.addr = addr;
	}
	if(dob !== req.session.passport.user.dob){
		await accountModel.updateDob(dob, id_acc);
		req.session.passport.user.dob = dob;
	}
	if(email !== req.session.passport.user.email){
		const userByEmail = await accountModel.findEmail(email);
		// email incorrect or third party account's email
		if(userByEmail !== null){

			return res.render('vwAccount/edit_profile', {
				layout: 'non_sidebar.hbs',
				err_message: "Thất bại!Email đã được sử dụng trong hệ thống!",
				user
			});

		}
		else {

			const token = cryptoRandomString({length: 100});

			var exprD = await mailingModel.getNewExpiredDate();
			await accountModel.addToNotVerifiedEmail({id_acc: id_acc, token: token, expired_date: exprD});

			const host = req.headers.host;
			await mailingModel.sendVerifyEmail(name, email, host, req.protocol + '://' + host, id_acc, token, 24);
			await accountModel.updateEmail(email, id_acc);
			req.session.passport.user.email = email;
			req.user.email = email;
		}
	}
	const reuser = await accountModel.findID(id_acc);
	req.user = reuser;
	req.session.passport = {user: reuser};
	// res.render('vwAccount/profile',{
	// 	layout: 'non_sidebar.hbs'
	// });
	const url = "/profile/" + id_acc;
	return res.redirect(url);


});

router.get('/change-password', checkPermission.notLogin, async function(req, res){
	if(res.locals.canChangePwd == false){
		return res.redirect(req.headers.referer || '/');
	}

	res.render('vwAccount/resetPassword',{
		layout: 'non_sidebar.hbs',
		id_acc: req.session.passport.user.id,
		isChangePwd: true
	});


});

router.post('/change-password', async function(req, res){
	const password = req.body.password;
	const id_acc = req.body.id_acc;
	const salt = bcrypt.genSaltSync(10);
	const hashedPwd = bcrypt.hashSync(password, salt);
	const user = await accountModel.findID(id_acc);
	if(user === null){
		return res.redirect(res.headers.referer || '/');
	}
	if(typeof(req.body.OldPwd) !== 'undefined'){
		// change pwd
		// not login
		if(typeof (req.user) === 'undefined'){
			return res.redirect('/login');
		}
		const ret = bcrypt.compareSync(req.body.OldPwd, user.pwd);
		if(ret === false){
			// console.log('false')

			return res.render('vwAccount/resetPassword',{
				layout: 'non_sidebar.hbs',
				id_acc: id_acc,
				isChangePwd: true,
				err_message: 'Đổi mật khẩu thất bại'
			});

			return
		}
		await accountModel.updatePwd(hashedPwd, id_acc);
		console.log('true');

		return res.render('vwAccount/resetPassword',{
			layout: 'non_sidebar.hbs',
			id_acc: id_acc,
			isChangePwd: true,
			success: 'Đổi mật khẩu thành công'
		})

	}
	else{
		// forgot pwd
		const token = req.body.token;
		console.log(id_acc, '\n', token);
		const info = await accountModel.findInForgotPwd({ id_acc: id_acc, token: token });
		if(info === null){
			return res.redirect(req.headers.referer || '/');
		}
		await accountModel.deleteForgotPwd(id_acc);
		await accountModel.updatePwd(hashedPwd, id_acc);
		req.session.forgotPwd = true;
	}

	return res.redirect('/login');
});

router.get('/forgot-password', function(req, res){
	res.render('vwAccount/forgot_password',{
		layout: false
	});
});

router.post('/forgot-password', async function(req, res){
	const user = await accountModel.findEmail(req.body.email);
	// email incorrect or third party account's email
	if(user === null || user.pwd === null){
		return res.render('vwAccount/forgot_password', {
			layout: false,
			email: req.body.email,
			notify: "Không có tài khoản nào liên kết với email này"
		});
	}
	// valid email
	const token = cryptoRandomString({length: 100});
	const exprD = await mailingModel.getNewExpiredDate();
	const host = req.headers.host;
	await accountModel.addToForgotPwd({id_acc: user.id, token: token, expired_date: exprD});
	// send mail change pwd
	await mailingModel.sendForgotPwdEmail(user.name, user.email,
		host, req.protocol + '://' + host, user.id, token, 24)
	return res.render('vwAccount/forgot_password', {
		layout: false,
		email: req.body.email,
		success: "Đã gửi một yêu cầu thay đổi mật khẩu đến email của bạn"
	});
});

// router.post('/logout', function(req, res){
// 	if(typeof(req.session.idAcc) !== 'undefined'){
//       	delete req.session.idAcc;
//     }
//     req.logout();
//     const url = req.headers.referer || '/';
//     res.redirect(url);
// });


export default router;