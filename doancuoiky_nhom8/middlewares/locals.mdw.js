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
		if(typeof (req.user) === 'undefined'){
			authUser = false;
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
	    res.locals.lcAuthUser = authUser;
	    next();
	});
}