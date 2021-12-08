import { engine } from 'express-handlebars';
import hbs_sections from 'express-handlebars-sections';
import express from 'express';

export default function(app){
	app.use(express.urlencoded({
	    extended: true
	}));
	app.use(express.json({
	  type: "*/*"
	}));
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
			section: hbs_sections()
	    }
	}));

	app.set('view engine', 'hbs');
	app.set('views', './views');
}