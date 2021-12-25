import db from '../utils/database.js';

export default {
	add(entity) {
		entity.id = +entity.id;
		entity.id_assessor = +entity.id_assessor;
		entity.id_acc = +entity.id_acc;
		entity.mark = +entity.mark;
		console.log(entity);
		return db("rate_history").insert(entity);
	}

}