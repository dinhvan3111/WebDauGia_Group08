import envVar from '../utils/envVar.js';
import db from '../utils/database.js';
import sgMail from '@sendgrid/mail';


sgMail.setApiKey(envVar.SENDGRID_API_KEY);
const fromEmail = envVar.FROM_EMAIL;
const TRANSACTION_TEMPLATE = envVar.SENDGRID_TRANSACTION_TEMPLATE;

async function sendEmail(mailMsg){
	try {
	    await sgMail.send(mailMsg);
	    // console.log(host);
	} catch (error) {
	    console.error(error);

	    if (error.response) {
	      console.error(error.response.body);
	    }
	}
};

export default {
	// Ra giá thành công, giá sản phẩm được cập nhật
	async bidSuccess(name, email, host, urlLink, idAcc, token, hour){
		
	},
	async bidSuccess_sendSeller(name, email, product_name, link_product, 
		bidder_name, link_bidder, bid_price){
		const mailMsg = {
			to: email,
			from: fromEmail,
			subject: `Sản phẩm ${product_name} của bạn vừa có người ra giá`,
			templateId: TRANSACTION_TEMPLATE,
			dynamic_template_data: {
				subject: `Sản phẩm ${product_name} của bạn vừa có người ra giá`,
				icon: 'fa fa-gavel mt-3',
			    name: name,
			    header: 'CÓ NGƯỜI RA GIÁ MỚI',
			    description: 'sản phẩm của bạn vừa có người ra giá mới',
			    product_name: product_name,
			    link_product: link_product,
			    bidder: bidder_name,
			    link_bidder: link_bidder,
			    bid_price_1: `Giá đã đặt: ${bid_price} VNĐ`
			}
		};
		return await sendEmail(mailMsg);
	},
	async bidSuccess_sendBidder(name, email, product_name, link_product, bid_price){
		const mailMsg = {
			to: email,
			from: fromEmail,
			subject: `Bạn đã đấu giá thành công sản phẩm ${product_name}`,
			templateId: TRANSACTION_TEMPLATE,
			dynamic_template_data: {
				subject: `Bạn đã đấu giá thành công sản phẩm ${product_name}`,
				icon: 'fa fa-gavel mt-3',
			    name: name,
			    header: 'RA GIÁ THÀNH CÔNG',
			    description: 'chúc mừng bạn đã ra giá thành công',
			    product_name: product_name,
			    link_product: link_product,
			    bid_price_1: `Giá đã đặt: ${bid_price} VNĐ`
			}
		};
		return await sendEmail(mailMsg);
	},
	async bidSuccess_sendOldBidder(name, email, product_name, link_product,
		bid_price, win_price){
		const mailMsg = {
			to: email,
			from: fromEmail,
			subject: `Đã có người đặt giá cao hơn cho sản phẩm ${product_name}`,
			templateId: TRANSACTION_TEMPLATE,
			dynamic_template_data: {
				subject: `Đã có người đặt giá cao hơn cho sản phẩm ${product_name}`,
				icon: 'fa fa-times-circle mt-3',
			    name: name,
			    header: 'ĐẤU GIÁ THẤT BẠI',
			    description: 'Chúng tôi rất tiếc, bạn đã đấu giá thất bại. Đã có người ra giá cho sản phẩm cao hơn bạn',
			    product_name: product_name,
			    link_product: link_product,
			    bid_price_1: `Giá bạn đã đặt: ${bid_price} VNĐ`,
			    bid_price_2: `Giá hiện tại: ${win_price} VNĐ`,
			    re_bid: true
			}
		};
		return await sendEmail(mailMsg);
	},


	/////////////////////////////////////////////////

	// Người mua bị từ chối ra giá
	async rejectBidder(name, email, product_name, link_product, bid_price){
		const mailMsg = {
			to: email,
			from: fromEmail,
			subject: `Bạn vừa bị từ chối ra giá cho sản phẩm ${product_name}`,
			templateId: TRANSACTION_TEMPLATE,
			dynamic_template_data: {
				subject: `Bạn vừa bị từ chối ra giá cho sản phẩm ${product_name}`,
				icon: 'fa fa-gavel mt-3',
			    name: name,
			    header: 'BẠN BỊ TỪ CHỐI RA GIÁ',
			    description: 'Rất tiếc, bạn vừa bị người bán từ chối ra giá cho sản phẩm:',
			    product_name: product_name,
			    link_product: link_product,
			    bid_price_1: `Giá bạn đã đặt: ${bid_price} VNĐ`
			}
		};
		return await sendEmail(mailMsg);
	},


	//////////////////////////////////////////////////

	// Đấu giá kết thúc, không có người mua
	async endBidding_noOneBid(name, email, product_name, link_product, expired_date){
		const mailMsg = {
			to: email,
			from: fromEmail,
			subject: `Sản phẩm ${product_name} của bạn không có lượt ra giá nào`,
			templateId: TRANSACTION_TEMPLATE,
			dynamic_template_data: {
				subject: `Sản phẩm ${product_name} của bạn không có lượt ra giá nào`,
				icon: 'fa fa-user-times mt-3',
			    name: name,
			    header: 'KHÔNG CÓ NGƯỜI MUA',
			    description: 'Chúng tôi rất tiếc, sản phẩm của bạn đã hết thời gian đăng bán mà không có người nào ra giá cho sản phẩm của bạn',
			    product_name: product_name,
			    link_product: link_product,
			    expired_date: expired_date
			}
		};
		return await sendEmail(mailMsg);
	},

	//////////////////////////////////////////////////

	// Đấu giá kết thúc
	async endBidding(){

	},
	async endBidding_sendSeller(name, email, product_name, link_product,
		bidder_name, link_bidder, win_price){
		const mailMsg = {
			to: email,
			from: fromEmail,
			subject: `Bạn đã bán thành công sản phẩm ${product_name}`,
			templateId: TRANSACTION_TEMPLATE,
			dynamic_template_data: {
				subject: `Bạn đã bán thành công sản phẩm ${product_name}`,
				icon: 'fa fa-calendar-check-o mt-3',
			    name: name,
			    header: 'ĐẤU GIÁ KẾT THÚC',
			    description: 'Chúc mừng, bạn đã bán thành công sản phẩm:',
			    product_name: product_name,
			    link_product: link_product,
			    bidder: bidder_name,
			    link_bidder: link_bidder,
			    bid_price_2: `Giá bán: ${win_price} VNĐ`
			}
		};
		return await sendEmail(mailMsg);
	},
	async endBidding_sendBidder(name, email, product_name, link_product, win_price){
		const mailMsg = {
			to: email,
			from: fromEmail,
			subject: `Bạn đã chiến thắng đấu giá sản phẩm ${product_name}`,
			templateId: TRANSACTION_TEMPLATE,
			dynamic_template_data: {
				subject: `Bạn đã chiến thắng đấu giá sản phẩm ${product_name}`,
				icon: 'fa fa-check-circle mt-3',
			    name: name,
			    header: 'CHIẾN THẮNG ĐẤU GIÁ',
			    description: 'Chúc mừng, bạn đã chiến thắng đấu giá sản phẩm:',
			    product_name: product_name,
			    link_product: link_product,
			    bid_price_2: `Giá chiến thắng: ${win_price} VNĐ`
			}
		};
		return await sendEmail(mailMsg);
	},

	//////////////////////////////////////////////////
}