import db from '../utils/database.js';
import numeral from 'numeral';
import moment from 'moment';
import productModel from '../models/product.model.js';
import mailing from '../models/mailing.transaction.model.js';
import accountModel from '../models/account.model.js';

export default{
	async findByProductID(id_product){
		const res = await db('bid_price').where({id_product: id_product})
						.orderBy([{ column: 'max_bid_price', order: 'desc'}, 
							{ column: 'time'}]);
		if(res.length == 0){
			return null;
		}
		return res;
	},
	async findExistedBidder(id_acc, id_product){
		const res = await db('bid_price').where({id_product: id_product, id_acc: id_acc});
		if(res.length == 0){
			return null;
		}
		return res[0];
	},
	async addNewPriceHoldingBidder(id_product, id_acc, max_bid_price){
		const isExisted = await this.findExistedBidder(id_acc, id_product);
		if(isExisted !== null){
			return await db('bid_price').update({max_bid_price: max_bid_price})
										.where({id_product: id_product, id_acc: id_acc});
		}

		return await db('bid_price').insert({id_product: id_product, 
							id_acc: id_acc, max_bid_price:max_bid_price});
	},
	async addNewAuction(id_acc, id_product, bid_price){
		await db('bid_history').insert({id_acc: id_acc,
								id_product: id_product,
								in_bid_price: bid_price});
	},
	async autoAuction(req){
		var max_bid_price = req.body.max_bid_price;
	    const id_product = req.body.id_product;
	    const id_acc = req.user.id;
	    const product = await productModel.findID(id_product);
	    const step_price = parseInt(product.step_price);
	    max_bid_price = max_bid_price.split(' ')[1].replace(/,/g, '');
	    max_bid_price = parseInt(max_bid_price);
	    const bidderList = await this.findByProductID(id_product);
	    var price_hoding_bidder= null;
	    if(bidderList !== null){
	    	price_hoding_bidder = bidderList[0];
	    }
	    var newInPrice = 0;

	    const seller = await accountModel.findID(product.id_seller);
	    var price_hoding_bidder_info = null;
	    if(price_hoding_bidder !== null){
	    	price_hoding_bidder_info = await accountModel.findID(price_hoding_bidder.id_acc);
	    }
	    const domain = req.protocol + '://' + req.headers.host;
	    const link_product = domain + '/products/' + id_product;
	    var link_price_holding_bidder = null;
	    if(price_hoding_bidder !== null){
	    	link_price_holding_bidder = domain + '/profile/' + price_hoding_bidder.id_acc;
	    }
	    const link_new_bidder = domain + '/profile/' + id_acc;
	    var change_price_holding_bidder = true;
	    var lowPrice = 0;

	    // Update end time
	    await this.updateProductTimeEnd(product);

	    if(price_hoding_bidder !== null){
	        if(price_hoding_bidder.max_bid_price < max_bid_price){
	            
	            newInPrice = parseInt(price_hoding_bidder.max_bid_price) + 
	                                parseInt(product.step_price);

	            await this.addNewAuction(id_acc,
	                                id_product,
	                                newInPrice);
	            await this.addNewPriceHoldingBidder(id_product, 
	                                id_acc, max_bid_price);
	            await productModel.updatePriceHoldingBidder(id_product, id_acc);

	            await mailing.bidSuccess_sendOldBidder(price_hoding_bidder_info.name,
	            		price_hoding_bidder_info.email, 
	            		product.name, link_product,
						numeral(price_hoding_bidder.max_bid_price).format('0,0'),
						numeral(newInPrice).format('0,0'));


	        }
	        else if(price_hoding_bidder.max_bid_price > max_bid_price){
	            change_price_holding_bidder = false;
	            lowPrice = max_bid_price;
	            await this.addNewAuction(id_acc,
	                            id_product,
	                            lowPrice);
	            newInPrice = parseInt(max_bid_price) + 
	                        parseInt(step_price);
	            await this.addNewAuction(price_hoding_bidder.id_acc,
	                                price_hoding_bidder.id_product,
	                                newInPrice);
	            
	        }
	        else{
	        	change_price_holding_bidder = false;
	        	lowPrice = max_bid_price - product.step_price;
	            await this.addNewAuction(id_acc,
	                                id_product,
	                                lowPrice);
	            newInPrice = parseInt(max_bid_price);
	            await this.addNewAuction(price_hoding_bidder.id_acc,
	                                    price_hoding_bidder.id_product,
	                                    newInPrice);
	        }
	    }
	    else{
	        await this.addNewPriceHoldingBidder(id_product,
	                            id_acc, max_bid_price);
	        newInPrice = parseInt(product.price);
	        await this.addNewAuction(id_acc,
	                                id_product,
	                                newInPrice);
	        await productModel.updatePriceHoldingBidder(id_product, id_acc);
	        
	       
	    }
	    if(change_price_holding_bidder === true){
	    	await mailing.bidSuccess_sendSeller(seller.name, seller.email,
	    			product.name, link_product, 
                	req.user.name, link_new_bidder, numeral(newInPrice).format('0,0'));
	        await mailing.bidSuccess_sendBidder(req.user.name, req.user.email,
	        		product.name, link_product, numeral(newInPrice).format('0,0'));
	    }
	    else{
	    	await mailing.bidSuccess_sendSeller(seller.name, seller.email,
	    			product.name, link_product, 
                	req.user.name, link_new_bidder, numeral(lowPrice).format('0,0'));
	    	await mailing.bidSuccess_sendSeller(seller.name, seller.email,
	    			product.name, link_product, 
                	price_hoding_bidder_info.name, link_price_holding_bidder,
                	numeral(newInPrice).format('0,0'));
	        await mailing.bidSuccess_sendBidder(req.user.name, req.user.email,
	        		product.name, link_product, numeral(lowPrice).format('0,0'));
	        await mailing.bidSuccess_sendOldBidder(req.user.name, req.user.email,
	        		product.name, link_product,
	        		numeral(max_bid_price).format('0,0'),
	        		numeral(newInPrice).format('0,0'));
	    }
	    await productModel.updateInPrice(id_product, newInPrice);


	},
	async deletePriceOfBidder(info){
		return await db('bid_price').where(info).del();
	},
	async updateProductTimeEnd(product){
		if(product.auto_renew == 1){
			const oldTimeEnd = moment(product.time_end, 'YYYY/MM/DD HH:mm:ss');
	    	const interval = oldTimeEnd.diff(moment(), 'minutes');
	    	if(interval >= 0 && interval <= 5){
	    		var newTimeEnd = oldTimeEnd.add(10, 'minutes')
	    							.format('YYYY/MM/DD HH:mm:ss');
	    		const sellerExpiredDate = await accountModel.getSellerExpiredDate(product.id_seller);
	    		const expirationDate = moment(sellerExpiredDate.time, 
	    								'YYYY/MM/DD HH:mm:ss');

	    		// Quá thời gian 7 ngày làm seller
	    		if(newTimeEnd.diff(expirationDate, 'seconds') > 0){
	    			newTimeEnd = expirationDate;
	    		}
	    		await productModel.updateProduct({
	    			id: product.id,
	    			time_end: newTimeEnd
	    		});
	    	}
	    }
	}
	
}