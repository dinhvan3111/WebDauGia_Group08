import passport from 'passport';
import express from 'express';

const router = express.Router();

router.post('/auth/facebook', passport.authenticate('facebook',{scope:'email'}));

router.get('/auth/facebook/callback',
    passport.authenticate('facebook', { successRedirect : '/', failureRedirect: '/login' }),
    function(req, res) {
    res.redirect('/');
});

router.post('/logout', function(req, res){
    req.logout();
    res.redirect('/');
});

export default router;