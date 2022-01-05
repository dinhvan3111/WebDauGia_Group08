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
			const isExisted = await this.findEmail(email);
			if(isExisted !== null && isExisted.pwd !== null){
				return null;
			}
			// console.log('findOrCreateByThirdPartyAcc line 37', info);
			// console.log('line 38: ', idThirdPartyAcc, displayName, provider);
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
		},

		// Password
		async addToForgotPwd(obj){
			const isExisted = await this.findInForgotPwd({ id_acc: obj.id_acc });
			// console.log(obj);
			if(isExisted === null){
				return await db('change_pwd').insert(obj);
			}
			else{
				return await this.updateForgotPwd(isExisted, obj);
			}
		},
		async findInForgotPwd(obj){
			const record = await db('change_pwd').where(obj);
			if(record.length == 0){
				return null;
			}
			return record[0];
		},
		async updateForgotPwd(obj, newObj){
			return await db('change_pwd').update(newObj).where({id_acc: obj.id_acc});
		},
		async deleteForgotPwd(id_acc){
			return await db('change_pwd').where('id_acc', id_acc).del();
		},
		async updatePwd(hashedPwd, id_acc){
			return await db('accounts').update({pwd: hashedPwd}).where({id: id_acc})
		},
		async updateName(name, id_acc){
			return await db('accounts').update({name: name}).where({id: id_acc})
		},
		async updateAddr(addr, id_acc){
			return await db('accounts').update({addr: addr}).where({id: id_acc})
		},
		async updateDob(dob, id_acc){
			return await db('accounts').update({dob: dob}).where({id: id_acc})
		},
		async updateEmail(email, id_acc){
			return await db('accounts').update({email: email}).where({id: id_acc})
		},

		// Rate 
		async countRate(id_acc){
			const upVoteCounter = await db('rate_history')
										.count('id_acc', {as: 'upVote'})
										.where({id_acc: id_acc, mark: 1});
			const downVoteCounter = await db('rate_history')
										.count('id_acc', {as: 'downVote'})
										.where({id_acc: id_acc, mark: 0});
			return {
				upVoteCounter: upVoteCounter[0].upVote,
				downVoteCounter: downVoteCounter[0].downVote
			};
		},
		async getUpVoteRatio(id_acc){
			const rateCounter = await this.countRate(id_acc);
			const totalRate = rateCounter.upVoteCounter + rateCounter.downVoteCounter;
			var user = {};
			user.des = 'Chưa có lượt đánh giá nào';
			user.starList = [];
			user.ratio = 0;
			user.percent = 0;
			user.total_rate = totalRate;
			for (let i = 0; i < 5; i++) {
	        	user.starList.push(-1);
	        	// gray star
	        }
			if(totalRate != 0){
		        var upVoteRate = (rateCounter.upVoteCounter / totalRate) * 100;
		        upVoteRate = upVoteRate.toFixed(1);
		        user.percent = upVoteRate;
		        user.des = `Có ${upVoteRate}% người đã đánh giá tốt`;
		        // based on 5 stars
		        var star = upVoteRate / 20;
		        user.ratio = star.toFixed(1);
		        for (let i = 0; i < 5; i++) {
		        	if(star - 1 >= 0){
		        		// yellow star
		        		user.starList[i] = 1;
		        		star = star - 1;
		        	}
		        	else if(star - 0.5 >= 0){
		        		// combined gray and yellow
		        		user.starList[i] = 0;
		        		star = star - 0.5;
		        	}
		        }
		    }

		    return user;
		},

		starPercentage(ratio){
			const totalStars = 5;
			// Tỉ lệ tích cực
			const starPercentage = (Number.parseFloat(ratio) / totalStars) *100;
			return starPercentage;
		},
		starPercentageRounded(ratio){
			const totalStars = 5;
			// Tỉ lệ tích cực
			const starPercentage = (Number.parseFloat(ratio) / totalStars) *100;

			// Làm tròn
			const starPercentageRounded = `${Math.round(starPercentage/10)*10}%`;
			return starPercentageRounded;
		},

		// Seller
		async getSellerExpiredDate(seller_id){
			const info = await db('seller_expired_day').where({id: seller_id});
			if(info.length == 0){
				return null;
			}
			return info[0];
		},

}