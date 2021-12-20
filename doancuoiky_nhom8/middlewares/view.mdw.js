import { engine } from 'express-handlebars';
import hbs_sections from 'express-handlebars-sections';
import express from 'express';

export default function(app){
	app.use(express.urlencoded({
	    extended: true,
	    limit: '25mb'
	}));
	// app.use(express.json({
	//   type: "*/*",
	//   limit: '25mb'
	// }));
	app.engine('hbs', engine({
	    defaultLayout: 'main.hbs',
	    helpers: {
	        format_number(num){
	            num = num + '';
	            for(let i = num.length - 3; i > 0; i-=3){
	                num = num.slice(0, i) + ',' + num.slice(i);
	            }
	            return num;
	        },
			section: hbs_sections(),
			isAdmin(permission){
				if(permission == 1){
					return true;
				}
				return false;
			},
			isSeller(permission){
				console.log(permission);
				if(permission <= 2){
					return true;
				}
				return false;
			}
	    }
	}));

	app.set('view engine', 'hbs');
	app.set('views', './views');
}