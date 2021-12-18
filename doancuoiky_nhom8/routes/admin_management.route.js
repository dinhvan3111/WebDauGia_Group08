import express from 'express';
import accountModel from '../models/account.model.js';
import fetch from 'node-fetch';
import bcrypt from 'bcrypt';
import moment from 'moment';
import cryptoRandomString from 'crypto-random-string';
import envVar from '../utils/envVar.js';
import mailingModel from '../models/mailing.OTP.model.js';
import adminManagement from '../models/admin_management.model.js';
import checkPermission from '../middlewares/permission.mdw.js';

const router = express.Router();

router.get('/accept_request', checkPermission.isNotSeller, async function(req, res){
	const getRequests = await adminManagement.getAllRequest();
	const allRequests = []
	for(let i =0; i < getRequests.length;i++){
		const userRequest = await accountModel.findID(getRequests[i].id_acc);
		allRequests.push(userRequest);
	}
	res.render('vwAccount/accept_request',{
		requests: allRequests,
		layout: 'non_sidebar.hbs'
	});
});
router.post('/accept_request', async function(req, res){
	const id = req.body.id;
	const isAccept = req.body.isAccept;
	await adminManagement.acceptRequest(id,isAccept);
	await adminManagement.removeRequest(id);
	const getRequests = await adminManagement.getAllRequest();
	const allRequests = []
	for(let i =0; i < getRequests.length;i++){
		const userRequest = await accountModel.findID(getRequests[i].id_acc);
		allRequests.push(userRequest);
	}
	res.render('vwAccount/accept_request',{
		requests: allRequests,
		layout: 'non_sidebar.hbs'
	});
});



export default router;