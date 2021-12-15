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
	}
}