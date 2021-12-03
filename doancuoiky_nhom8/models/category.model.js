import db from '../utils/database.js';

export default {
	getAll(){
		return db.select(['child.id', 'child.name as name', 'parent.name as parentN'])
				.from('categories as child')
				.leftJoin('categories as parent', 'child.parent_id', '=', 'parent.id')
				.orderBy('parent.name');
	},

	getAllParent() {
		return db.select(['ctg.id as id', 'ctg.name as name'])
			.from('categories as ctg')
			.where('ctg.parent_id', null);
	},

	getAllChildWithId(id){
		return db.select(['ctg.id as id', 'ctg.name as name'])
			.from('categories as ctg')
			.where('ctg.parent_id',id);
	}


}