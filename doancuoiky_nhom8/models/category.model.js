import db from '../utils/database.js';

export default {
	getAll(){
		return db.select(['child.id', 'child.name as name', 'parent.name as parentN'])
				.from('categories as child')
				.leftJoin('categories as parent', 'child.parent_id', '=', 'parent.id')
				.orderBy('parent.name');
	}


}