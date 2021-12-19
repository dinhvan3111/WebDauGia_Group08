import db from '../utils/database.js';
import moment from "moment";
// import DATE_FORMATER from 'dateformat';

export default{
	async findID(id_acc){
		const usr = await db('accounts')
								.where('id', id_acc);
		if(usr.length == 0){
			return null;
		}
		return usr[0];
	},
	async addRequest(id_acc){
		const checkIfInRequestDb = await db('request_upgrade').select('id_acc').where('id_acc',id_acc);
		const checkIfInSellerExpiredDb = await db('seller_expired_day').select('id').where('id',id_acc);
		if(checkIfInRequestDb[0]){
			return -1; // Đã trong hàng chờ
		}
		else if(checkIfInSellerExpiredDb[0]){
			return 0; // Đã là seller
		}
		else{
			await db('request_upgrade').insert({id_acc: id_acc});
			return 1;
		}
	},
	async removeRequest(id_acc){
		await db('request_upgrade').where('id_acc', id_acc).del();
	},
	getAllRequest(){
		return db('request_upgrade').select();
	},
	getAllSellerExpiredDay(){
		return db('seller_expired_day').select();
	},
	getAllAccounts(){
		return db('accounts').select();
	},
	async acceptRequest(id,isAccept){
		if(isAccept === 'true') {
			var dateExpired;
			dateExpired = moment().add(7, 'days').format('YYYY/MM/DD HH:mm:ss');
			// dateExpired.setDate(dateExpired.getDate() + 7);
			// dateExpired = dateExpired.getFullYear() + '-' +
			// 	('00' + (dateExpired.getMonth()+1)).slice(-2) + '-' +
			// 	('00' + dateExpired.getDate()).slice(-2) + ' ' +
			// 	('00' + dateExpired.getHours()).slice(-2) + ':' +
			// 	('00' + dateExpired.getMinutes()).slice(-2) + ':' +
			// 	('00' + dateExpired.getSeconds()).slice(-2);
			await db('accounts').update({id_permission: 2}).where('id',id);
			await db('seller_expired_day').insert({id: id,time: dateExpired});
			return await this.removeRequest(id);
		}
		else{
			return await this.removeRequest(id);
		}
	},
	async findExpiredSellerAuth(){
		const expiredList = await db.raw('SELECT * FROM seller_expired_day WHERE time <= now()');
		if(expiredList[0].length == 0){
			return null;
		}
		else{
			return expiredList[0];
		}
	},
	async lockUserById(id){
		await  db('accounts').update({is_locked: 1}).where('id',id);
	},
	async unlockUserById(id){
		await  db('accounts').update({is_locked: 0}).where('id',id);
	},
	async deleteUserById(id){
		await  db('accounts').where('id',id).del();
	},
	async endSellerAuth(id){
		await db('accounts').update({id_permission: 3}).where('id',id);
		return await db('seller_expired_day').where('id', id).del();
	}

}