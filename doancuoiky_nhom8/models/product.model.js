import db from '../utils/database.js';
import moment from 'moment';
import fileModel from '../models/upload.model.js';
import accountModel from '../models/account.model.js';
import biddingModel from '../models/bidding.model.js';
import watchListModel from '../models/watchlist.model.js';

export default {
	async findID(id){
		const product = await db('products')
								.where('id', id);
		if(product.length == 0){
			return null;
		}
		return product[0];
	},
	async getBidHistory(id_product){
		const bidHistory = await db('bid_history as bidHis')
				.select(['bidHis.time as time', 'bidHis.in_bid_price as in_bid_price',
						 'acc.name as bidder_name', 'acc.id as bidder_id'])
				.join('accounts as acc', 'acc.id', 'bidHis.id_acc')
				.join('products as p', 'p.id', 'bidHis.id_product')
				.where({'p.id': id_product})
				.orderBy('bidHis.id', 'desc');
		
		if(bidHistory.length == 0){
			return null;
		}
		for(let i = 0; i < bidHistory.length; i++){
			let splited = bidHistory[i].bidder_name.split(' ');
			bidHistory[i].bidder_name = '****' + splited[splited.length - 1];
		}
		return bidHistory;
	},
	async getProductsInSameCate(id_category, id_product, quantity){
		return await db('products').where({id_category: id_category})
									.whereNot({id: id_product})
									.orderBy('time_end', 'desc')
									.limit(quantity).offset(0);
	},
	async findIgnoredBidders(info){
		const res = await db('ignore_bidder').where(info);
		if(res.length == 0){
			return null;
		}
		return res;
	},
	async searchProduct(cateID, param){
		if(cateID == '' || cateID == '0'){
			const search_result = await db.select()
				.from('products')
				.whereRaw('MATCH(name,description) AGAINST(?)', param)
				.limit(12);
			return search_result;
		}
		else{
			const search_result = await db.select()
				.from('products')
				.whereRaw('id_category = ? AND MATCH(name,description) AGAINST(?)', [cateID,param])
				.limit(12);
			return search_result;
		}
	},
	async getProductDetail(req, product_info, id_product){
		if(product_info.buy_now_price == 0){
	        delete product_info.buy_now_price;
	    }
	    if(product_info.not_sold == 0){
	        delete product_info.not_sold;
	    }
	    moment.locale('vi');
	    const end_date = moment(product_info.time_end, 'YYYY/MM/DD HH:mm:ss');
	    if(end_date.diff(moment(), 'days') < 3){
	        product_info.time_end = end_date.fromNow();
	    }
	    else{
	        product_info.time_end = moment(product_info.time_end, 
	                        'YYYY/MM/DD hh:mm:ss').format('DD/MM/YYYY HH:mm:ss');
	    }
	    
	    product_info.time_start = moment(product_info.time_start, 
	                        'YYYY/MM/DD HH:mm:ss').format('DD/MM/YYYY HH:mm:ss');
	    
	    var seller = await accountModel.findID(product_info.id_seller);
	    const sellerVoteRatio = await accountModel.getUpVoteRatio(seller.id);
	    // console.log(sellerVoteRatio);
	    seller.des = sellerVoteRatio.des;
	    const bidHistory = await this.getBidHistory(id_product);
	    if(bidHistory !== null){
	        for(let i = 0; i < bidHistory.length; i++){
	            let bidderVoteRatio = await accountModel.getUpVoteRatio(bidHistory[i].bidder_id);
	            bidHistory[i].ratio = bidderVoteRatio.ratio
	            bidHistory[i].time = moment(bidHistory[i].time, 
	                            'YYYY/MM/DD hh:mm:ss').format('DD/MM/YYYY HH:mm:ss');
	        }
	    }
	    product_info.img = fileModel.getAllFileName('./public/img/products/' + id_product, id_product);
	    var inWatchList = false;
	    var canEdit = false;
	    var ignored = false;
	    var isHoldingPrice = false;
	    var max_bid_price = 0;
	    if(typeof(req.user) !== 'undefined'){
	        inWatchList = await watchListModel.findObj({id_acc: req.user.id, id_product: id_product});
	        if(inWatchList !== null){
	            inWatchList = true;
	        }
	        if(req.user.id == seller.id){
	            canEdit = true;
	        }
	        let isIgnored = await this.findIgnoredBidders({id_product: id_product, id_acc: req.user.id});
	        if(isIgnored !== null){
	            ignored = true;
	        }
	        if(product_info.id_win_bidder == req.user.id){
	            isHoldingPrice = true;
	            let holdingPriceBidder = await biddingModel.findByProductID(id_product);
	            max_bid_price = holdingPriceBidder.max_bid_price;
	        }

	    }
	    return {
	    	seller: seller,
	    	bidHistory: bidHistory,
	    	inWatchList: inWatchList,
	    	canEdit: canEdit,
	        ignored: ignored,
	        isHoldingPrice: isHoldingPrice,
	        max_bid_price: max_bid_price
	    }
	},


	// Manage products
	async addProduct(proObj){
		return await db('products').insert(proObj);
	},
	async deleteProduct(id_product){
		return await db('products').where({id: id_product}).del();
	},
	async updateProduct(proObj){
		return await db('products').where({id: proObj.id}).update(proObj);
	},
	async getLastID(){
		const product = 
			await db.raw('select p.id from products p where p.id >= all (select other.id from products other)');
		if(product[0].length == 0){
			return null;
		}
		return product[0][0].id;	
	},
	async createNewProduct(req, id, id_seller){
		const product = {
			id: id,
			name: req.body.name,
			price: req.body.price.split(' ')[1].replace(/,/g ,''),
			step_price: req.body.step_price.split(' ')[1].replace(/,/g, ''),
			description: req.body.description,
			id_seller: id_seller,
			id_category: req.body.id_category
		}
		const time_start = moment(req.body.time_start + ':00', 'DD/MM/YYYY HH:mm:ss')
							.format('YYYY/MM/DD HH:mm:ss');
		const time_end = moment(req.body.time_end + ':00', 'DD/MM/YYYY HH:mm:ss')
							.format('YYYY/MM/DD HH:mm:ss');
		product.time_start = time_start;
		product.time_end = time_end;
		if(req.body.auto_renew === true){
			product.auto_renew = 1;
		}
		if(req.body.allow_non_rating_bidder === true){
			product.allow_non_rating_bidder = 1;
		}
		var buy_now_price = req.body.buy_now_price.split(' ')[1]
		if(buy_now_price.length > 0){
			product.buy_now_price = buy_now_price.replace(/,/g, '');
		}
		// console.log(product);
		return await this.addProduct(product);
	},
	async updatePriceHoldingBidder(id_product, id_acc){
		await db('products').update({id_win_bidder: id_acc})
							.where({id: id_product});
	},
	async updateInPrice(id_product, newInPrice){
		await db('products').update({price: newInPrice})
							.where({id: id_product});
	},
	async updateProDescription(id,newDescription){
		await db('products').update({description: newDescription})
			.where({id: id});
	},
	async appendDescription(id,appendDes){
		const product = await this.findID(id);
		const proDes = product.description;
		console.log(product.description);
		const today = new Date();
		const date = today.toJSON().slice(0, 10);
		const nDate = date.slice(8, 10) + '/'
			+ date.slice(5, 7) + '/'
			+ date.slice(0, 4);
		console.log(nDate);
		appendDes = '<br>' +'<i class="fa fa-pencil" aria-hidden="true"></i>  '+ nDate + '<br>' + appendDes;
		const newDes = proDes + appendDes;
		console.log(newDes);
		await this.updateProDescription(id,newDes);
	}
	
}