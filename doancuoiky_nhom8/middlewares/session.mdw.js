import session from 'express-session';
import passport from 'passport';
import envVar from '../utils/envVar.js';
import accountModel from '../models/account.model.js';
import {connectionInfo} from '../utils/database.js';
import mysql2 from 'mysql2/promise';
import fnMySQLStore from 'express-mysql-session';
import FacebookStrategy from 'passport-facebook';
import fnGoogleStrategy from 'passport-google-oauth';


const GoogleStrategy = fnGoogleStrategy.OAuth2Strategy;

async function findOrCreate(profile){
	const idThirdPartyAcc = profile.id;
	const provider = profile.provider;
	const displayName = profile.displayName;
	const email = profile.emails[0].value || null;
	const info = await accountModel.findOrCreateByThirdPartyAcc(
					idThirdPartyAcc, displayName, email, provider);
	return info;
}

export default function (app){

	var connection = mysql2.createPool(connectionInfo);
	const MySQLStore = fnMySQLStore(session);
	const sessionStore = new MySQLStore({}, connection);

	app.set('trust proxy', 1);
	app.use(session({
		secret: 'Hello_World',
		resave: false,
		saveUninitialized: true,
		store: sessionStore,
		cookie: {
			// secure: true
		}
	}));
	app.use(passport.initialize());
	app.use(passport.session());

	passport.serializeUser(function(user, done) {
		// console.log('\n\nDay la user duoc gan: ', user, '\n\n');
	  done(null, user);
	});

	passport.deserializeUser(function(obj, done) {
		// console.log('\n\nDay la OBJ duoc gan: ', obj, '\n\n');
	  done(null, obj);
	});

	passport.use(new FacebookStrategy({
	    clientID: envVar.FB_APP_ID,
	    clientSecret: envVar.FB_APP_SECRET,
	    callbackURL: envVar.FB_CALLBACK_URL,
	    profileFields: ['id', 'emails', 'displayName']
	  },
	  async function(accessToken, refreshToken, profile, done) {
	    // process.nextTick(function () {
	      // console.log(accessToken, refreshToken, profile, done);
	      // profile = findOrCreate(profile);
	      const info = await findOrCreate(profile);
	      console.log(info);
	      return done(null, info);
	    // });
	  }
	));

	passport.use(new GoogleStrategy({
	    clientID: envVar.GG_CLIENT_ID,
	    clientSecret: envVar.GG_CLIENT_SECRET,
	    callbackURL: envVar.GG_CALLBACK_URL
	  },
	  async function(accessToken, refreshToken, profile, done) {
	    //   process.nextTick(function () {
	    //   // console.log(accessToken, refreshToken, profile, done);
	    	console.log(profile);
		    const info = await findOrCreate(profile);
		    console.log(info);
		    return done(null, info);
	    // });
	  }
	));

}