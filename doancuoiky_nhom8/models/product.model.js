import db from '../utils/database.js';
import moment from 'moment';

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
	async getImg(id_product){

	},
	async getThumbnail(id_product){

	},
	async getImgsExtra(id_product){

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
}