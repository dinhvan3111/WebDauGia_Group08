import envVar from '../utils/envVar.js';
import db from '../utils/database.js';
import sgMail from '@sendgrid/mail';


sgMail.setApiKey(envVar.SENDGRID_API_KEY);
const fromEmail = 'grouptest20@student.hcmus.edu.vn';

export default {
	async sendVerifyEmail(name, email, host, urlLink, idAcc, token, hour){
		var actvLink = `${urlLink}/mailing/verify-email?id_acc=${idAcc}&token=${token}`;
		console.log(actvLink);
		const mailMsg = {
			to: email,
			from: fromEmail,
			subject: `Xác nhận tài khoản của bạn tại ${host}`,
			templateId: envVar.SENDGRID_VERIFY_EMAIL_TEMPLATE,
			dynamic_template_data: {
				subject: `Xác nhận tài khoản của bạn tại ${host}`,
			    name: name,
			    activate_link: actvLink,
			    link: urlLink,
			    hour: hour
			}
		};
		try {
		    await sgMail.send(mailMsg);
		    // console.log(host);
		} catch (error) {
		    console.error(error);

		    if (error.response) {
		      console.error(error.response.body);
		    }
		}
	},
	async find(obj){
		const result = await db('not_verified_email').where(obj);
		if(result.length == 0){
			return null;
		}
		return result[0];
	},
	async delete(id_acc){
		return await db('not_verified_email').where('id_acc', id_acc).del();
	},
	async updateExprDate(id_acc, date){
		return await db('not_verified_email').update({expired_date: date})
						.where('id_acc', id_acc);
	},
	async getNewExpiredDate(){
		const hour = 24;
		var d = new Date(new Date().getTime() + (hour * 60 * 60 * 1000));
		return d.getFullYear() + '/' + (d.getMonth()+1) + '/' + d.getDate() + ' '
					+ d.getHours() + ':' + d.getMinutes() + ':' + d.getSeconds();
	},
}