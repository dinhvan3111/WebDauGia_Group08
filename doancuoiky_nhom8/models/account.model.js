import db from '../utils/database.js';

export default{
	async findUsername(username){
		const usrname = await db('accounts')
								.where('username', username);
		if(usrname.length == 0){
			return null;
		}
		return usrname[0];
	},
	async findEmail(email){
		const mail = await db('accounts')
								.where('email', email);
		if(mail.length == 0){
			return null;
		}
		return mail[0];
	},
	createAcc(usr, pwd, name, mail, dob, addr){
		return db('accounts').insert({username: usr, pwd: pwd,
						name: name, email: mail, dob: dob, addr: addr});
	}
}