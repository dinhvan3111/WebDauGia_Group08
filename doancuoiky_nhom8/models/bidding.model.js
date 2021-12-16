import db from '../utils/database.js';

export default{
	async findByProductID(id_product){
		const res = await db('bid_price').where({id_product: id_product})
						.orderBy([{ column: 'max_bid_price', order: 'desc'}, 
							{ column: 'time'}]);
		if(res.length == 0){
			return null;
		}
		return res[0];
	},
	async addNewPriceHoldingBidder(id_product, id_acc, max_bid_price){
		await db('bid_price').insert({id_product: id_product, 
							id_acc: id_acc, max_bid_price:max_bid_price});
	},
	async addNewAuction(id_acc, id_product, bid_price){
		await db('bid_history').insert({id_acc: id_acc,
								id_product: id_product,
								in_bid_price: bid_price});
	}
}