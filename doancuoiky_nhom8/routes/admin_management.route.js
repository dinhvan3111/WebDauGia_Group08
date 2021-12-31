import express from 'express';
import accountModel from '../models/account.model.js';
import fetch from 'node-fetch';
import bcrypt from 'bcrypt';
import moment from 'moment';
import cryptoRandomString from 'crypto-random-string';
import envVar from '../utils/envVar.js';
import pagingInfo from '../utils/paging.helper.js';
import mailingModel from '../models/mailing.OTP.model.js';
import adminManagement from '../models/admin_management.model.js';
import checkPermission from '../middlewares/permission.mdw.js';

const router = express.Router();

router.get('/accept_request', checkPermission.isNotAdmin, async function(req, res){
	const limit = 10;
	const page = req.query.page || 1;
	const offset = (page -1) * limit;
	const total = await adminManagement.countRequests();

	const paging = pagingInfo.getPagingInfo(limit, page, total);

	const getRequests = await adminManagement.getAllRequest(limit,offset);
	const allRequests = []
	for(let i = 0; i < getRequests.length; i++){
		const userRequest = await adminManagement.findID(getRequests[i].id_acc);
		allRequests.push(userRequest);
	}
	res.render('vwAccount/accept_request',{
				page,
                nextPage: paging.nextPage, 
                prePage: paging.prePage, 
                disableNext: paging.disableNext, 
                disablePre: paging.disablePre,
                pageNumber: paging.pageNumber,
				totalPage: paging.totalPage,
				requests: allRequests,
				layout: 'non_sidebar.hbs'
	});
});
router.post('/accept_request', checkPermission.isNotAdmin, async function(req, res){
	const id = req.body.id;
	const isAccept = req.body.isAccept;
	await adminManagement.acceptRequest(id,isAccept);
	await adminManagement.removeRequest(id);
	const getRequests = await adminManagement.getAllRequest();
	const allRequests = []
	for(let i =0; i < getRequests.length;i++){
		const userRequest = await adminManagement.findID(getRequests[i].id_acc);
		allRequests.push(userRequest);
	}
	res.render('vwAccount/accept_request',{
		requests: allRequests,
		layout: 'non_sidebar.hbs'
	});
});

router.get('/seller-management', checkPermission.isNotAdmin, async function(req, res){
	const limit = 10;
	const page = req.query.page || 1;
	const offset = (page -1) * limit;
	const total = await adminManagement.countSellerExpiredDay();

	const paging = pagingInfo.getPagingInfo(limit, page, total);

	const getSellersExpiredDay = await adminManagement.getAllSellerExpiredDay(limit,offset);
	const allSellers = []
	for(let i =0; i < getSellersExpiredDay.length;i++){
		const expiredTime = moment(getSellersExpiredDay[i].time,
								'YYYY/MM/DD HH:mm:ss').format('HH:mm:ss DD/MM/YYYY');
		const sellers = await adminManagement.findID(getSellersExpiredDay[i].id);
		sellers.time = expiredTime;
		allSellers.push(sellers);
	}
	res.render('vwAccount/sellers_expired_day',{
				page,
                nextPage: paging.nextPage, 
                prePage: paging.prePage, 
                disableNext: paging.disableNext, 
                disablePre: paging.disablePre,
                pageNumber: paging.pageNumber,
				totalPage: paging.totalPage,
				allSellers,
				layout: 'non_sidebar.hbs'
	});
});
router.post('/seller-management', checkPermission.isNotAdmin, async function(req, res){
	const id = req.body.id;
	await adminManagement.endSellerAuth(id);
	res.redirect('/admin/seller-management');
});
router.get('/account-management', checkPermission.isNotAdmin, async function(req, res){
	const limit = 10;
	const page = req.query.page || 1;
	const offset = (page -1) * limit;
	const total = await adminManagement.countAccounts();

	const paging = pagingInfo.getPagingInfo(limit, page, total);

	const accountList = await adminManagement.getAllAccounts(limit,offset);
	for(let i =0; i < accountList.length; i++){
		if(accountList[i].id_permission === 2){
			accountList[i].permissionName = 'Seller';
		}
		else if(accountList[i].id_permission === 3){
			accountList[i].permissionName = 'Bidder';
		}
		else{
			accountList[i].permissionId = 1;
			accountList[i].permissionName = 'Admin';
		}
	}
	res.render('vwAccount/account_management',{
				page,
                nextPage: paging.nextPage, 
                prePage: paging.prePage, 
                disableNext: paging.disableNext, 
                disablePre: paging.disablePre,
                pageNumber: paging.pageNumber,
				totalPage: paging.totalPage,
				accountList,
				layout: 'non_sidebar.hbs'
	});
});
router.post('/account-management', checkPermission.isNotAdmin, async function(req, res){
	const id = req.body.id;
	const action = req.body.action;
	if(action === 'lock'){
		await adminManagement.lockUserById(id);
	}
	if(action === 'unlock'){
		await  adminManagement.unlockUserById(id);
	}
	// else{
	// 	await  adminManagement.deleteUserById(id);
	// }
	res.redirect('/admin/account-management');
});


export default router;