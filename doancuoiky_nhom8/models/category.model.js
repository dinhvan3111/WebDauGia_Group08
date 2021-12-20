import db from '../utils/database.js';

export default {
    getAll() {
        return db.select(['child.id', 'child.name as name', 'parent.name as parentN'])
            .from('categories as child')
            .leftJoin('categories as parent', 'child.parent_id', '=', 'parent.id')
            .orderBy('parent.name');
    },
    getAllChild() {
        return db('categories').where('parent_id', !null);
    },
    getAllParent() {
        return db.select(['ctg.id as id', 'ctg.name as name'])
            .from('categories as ctg')
            .where('ctg.parent_id', null);
    },
    async findProductByIdCtg(id) {
        const list = await db('products').where('id_category', id);
        if (list.length === 0)
            return null;

        return list[0];
    },
    getAllChildWithId(id) {
        return db.select(['ctg.id as id', 'ctg.name as name'])
            .from('categories as ctg')
            .where('ctg.parent_id', id);
    },
    async getAllChildCate() {
        const cateList = await db.raw(`select c.id, c.name
                                       from categories c
                                       where c.parent_id is not NULL`);
        if (cateList.length == 0) {
            return null;
        }
        return cateList[0];
    },
    add(entity) {
        return db('categories').insert(entity);
    },
    patch(entity) {
        console.log(entity);
        const id = entity.id;
        delete entity.id;

        return db('categories')
            .where('id', id)
            .update(entity);
    },
    async findByName(name) {
        const list = await db('categories').where('name', name);
        if (list.length === 0)
            return null;

        return list[0];
    },
    async findById(id) {
        const list = await db('categories').where('id', id);
        if (list.length === 0)
            return null;

        return list[0];
    },
    deleteById(id) {
        return db('categories')
            .where('id', id)
            .del();
    },
    // async getProductByIdCtg(cateID, sort) {
    //     var result = null;
    //
    //     if (sort === '0') {
    //         result = await db.select()
    //             .from('products')
    //             .where("id_category", cateID)
    //             .limit(12);
    //     } else if (sort === '1') { // Thời gian kết thúc giảm dần
    //         result = await db.select()
    //             .from('products')
    //             .where("id_category", cateID)
    //             .limit(12).orderBy('time_end', 'desc');
    //     } else { // Giá tăng dần
    //         result = await db.select()
    //             .from('products')
    //             .where("id_category", cateID)
    //             .limit(12).orderBy('price', 'asc');
    //     }
    //     return result;
    //
    // },

}