import db from '../utils/database.js';

export default{
	async findID(id_acc){
		const usr = await db('accounts')
								.where('id', id_acc);
		if(usr.length == 0){
			return null;
		}
		return usr[0];
	},
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
	async createAcc(usrObj){
		return await db('accounts').insert(usrObj);
	},
	async findByThirdPartyAcc(idThirdPartyAcc, provider){
		const info = await db.select(['a.id as id', 'a.email', 'a.name', 'extAcc.id_in_third_party', 'extAcc.provider'])
				.from('accounts as a')
				.join('third_party_account as extAcc', 'a.id', '=', 'extAcc.id')
				.where({ username: idThirdPartyAcc + provider });
		if(info.length == 0){
			return null;
		}
		return info[0];
	},
	async addThirdPartyInfo(infoObj){
		return await db('third_party_account').insert(infoObj);
	},
	async findOrCreateByThirdPartyAcc(idThirdPartyAcc, displayName, email, provider){
		var info = await this.findByThirdPartyAcc(idThirdPartyAcc, provider);
		if(await this.findEmail(email) !== null){
			return null;
		}
		// console.log('findOrCreateByThirdPartyAcc line 37', info);
		console.log('line 38: ', idThirdPartyAcc, displayName, provider);
		if(info === null){
			const usrname = idThirdPartyAcc + provider;
			const usrObj = {
				name: displayName,
				username: usrname
			};
			if(email !== null){
				usrObj.email = email;
			}
			await this.createAcc(usrObj);
			const newUsr = await this.findUsername(usrname);
			const newId = newUsr.id;
			// console.log('newID = ', newId);
			const thirdPartyInfoObj = {
				id: newId,
				id_in_third_party: idThirdPartyAcc,
				provider: provider
			};
			await this.addThirdPartyInfo(thirdPartyInfoObj);
			info = {
				id: newId,
				email: email,
				name: displayName,
				idThirdPartyAcc: idThirdPartyAcc,
				provider: provider,
				username: usrname
			}
		}
		return info;
	},
	async addToNotVerifiedEmail(obj){
		return await db('not_verified_email').insert(obj);
	}
}