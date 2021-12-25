import db from '../utils/database.js';

export default {
	async add(id_acc, id_product){
		return await db('watch_list').insert({id_acc: id_acc, id_product: id_product});
	},
	async findObj(obj){
		const line = await db('watch_list').where(obj);
		if(line.length == 0){
			return null;
		}
		return line[0];
	},
	async getWatchListById(id, limit, offset){
		return await db('watch_list').where('id_acc',id).limit(limit).offset(offset);
	},
	async IsProductOnWatchList(id_acc,id_product){
		const product = await db('watch-list')
			.where("id_acc",id_acc,"id_product",id_product);
		if(product.length == 0){
			return null;
		}
		return product[0];
	},
	async countWatchProductById(id){
		const result = await db('watch_list').where('id_acc',id).count({amount: 'id_product'});
		return result[0].amount;
	}
}