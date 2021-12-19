import categoryModel from '../models/category.model.js';
import envVar from '../utils/envVar.js';

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
	    var maxCate = 0;
		for(let i = 0; i < result.length;i++){
			if(result[i].subCate.length > maxCate){
				maxCate = result[i].subCate.length;
			}
		}
		maxCate = (100 / (maxCate+1)) - 1;
		res.locals.maxLcCategories = maxCate;
	    res.locals.lcCategories = result;
	    next();
	});

	app.use(async function (req, res, next){
	    res.locals.lcCaptchaPublicKey = envVar.CAPTCHA_PUBLIC_KEY;
	    next();
	});
	app.use(async function (req, res, next){
		// console.log(req.session.passport);
		var authUser = req.session.passport;
		res.locals.canChangePwd = false;
		if(typeof (req.user) === 'undefined'){
			authUser = false;
		}
		else{
			res.locals.permission = req.session.passport.user.id_permission;
			if(typeof(req.user.provider) === 'undefined'){
				res.locals.canChangePwd = true;
			}
		}
		// if(typeof (req.session.passport.user) === 'undefined'){
		// 	authUser = false;
		// }
		// else{
		// 	// console.log(req.session.passport.user.emails[0].value);
		// }
		// req.session.authUser = authUser;
		
		// console.log(req.session);
		// console.log(req.user);
		// console.log(authUser);
	    res.locals.lcAuthUser = authUser;
	    next();
	});
}