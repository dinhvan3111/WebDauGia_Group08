import db from '../utils/database.js';
import fileModel from "./upload.model.js";

export default {
	add(entity) {
		entity.id_product = +entity.id_product;
		entity.id_assessor = +entity.id_assessor;
		entity.id_acc = +entity.id_acc;
		entity.mark = +entity.mark;
		console.log(entity);
		return db("rate_history").insert(entity);
	},
	async findByID(id){
		const usr = await db('rate_history')
			.where('id_acc', id);
		if(usr.length == 0){
			return null;
		}
		return usr[0];
	},
	async getDetailRate(id_acc) {
		const sql = `select r.id_assessor,r.id_acc,r.mark,r.comment, p.id, p.name, a.name as nameAssessor
					 from rate_history r, products p, accounts a
					 where r.id_product = p.id AND a.id = r.id_assessor and id_acc = ${id_acc}`;
		const raw = await db.raw(sql);
		var result = raw[0];
		for(let i = 0; i < result.length; i++){
			result[i].img = fileModel.getAllFileName('./public/img/products/'
				+ result[i].id,
				result[i].id).thumb;
		}
		return result;
	},

}