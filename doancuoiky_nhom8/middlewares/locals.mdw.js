import categoryModel from '../models/category.model.js';
import dotenv from 'dotenv';
dotenv.config();

export default function(app){

	app.use(async function (req, res, next){
	     const categories = await categoryModel.getAll();
	     var result = [];
	     for (let i = 0; i < categories.length; i++){
	        if(!categories[i].parentN){
	            var Cate = [];
	            for(let j = i + 1; j < categories.length; j++){
	                let subCate = {};
	                if(categories[i].name == categories[j].parentN){
	                    subCate.id = categories[j].id;
	                    subCate.name = categories[j].name;
	                }
	                else{
	                    continue;
	                }
	                Cate.push(subCate);
	            }
	            result.push({
	                id: categories[i].id,
	                name: categories[i].name,
	                subCate: Cate
	            });
	        }
	    }
	    res.locals.lcCategories = result;
	    res.locals.lcCaptchaPublicKey = process.env.CAPTCHA_PUBLIC_KEY;
	    next();
	});
}