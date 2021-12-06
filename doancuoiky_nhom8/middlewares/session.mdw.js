import session from 'express-session';
import passport from 'passport';
import envVar from '../utils/envVar.js';
import FacebookStrategy from 'passport-facebook';

export default function (app){
	app.set('trust proxy', 1);
	app.use(session({
		secret: 'Hello_World',
		resave: false,
		saveUninitialized: true,
		cookie: {
			// secure: true
		}
	}));
	app.use(passport.initialize());
	app.use(passport.session());

	passport.serializeUser(function(user, done) {
	  done(null, user);
	});

	passport.deserializeUser(function(obj, done) {
	  done(null, obj);
	});

	passport.use(new FacebookStrategy({
	    clientID: envVar.FB_APP_ID,
	    clientSecret: envVar.FB_APP_SECRET,
	    callbackURL: envVar.FB_CALLBACK_URL
	  },
	  function(accessToken, refreshToken, profile, done) {
	    process.nextTick(function () {
	      console.log(accessToken, refreshToken, profile, done);
	      return done(null, profile);
	    });
	  }
	));
}