import passport from 'passport';
import express from 'express';

const router = express.Router();

router.post('/auth/facebook', passport.authenticate('facebook',{scope: ['email']}));

router.get('/auth/facebook/callback',
    passport.authenticate('facebook', {failureRedirect: '/login' }),
    function(req, res) {
        const url = req.session.retUrl || '/';
        res.redirect(url);
});

router.post('/auth/google', 
  passport.authenticate('google', { scope : ['profile', 'email'] }));
 
router.get('/auth/google/callback', 
  passport.authenticate('google', { failureRedirect: '/login' }),
  function(req, res) {
    const url = req.session.retUrl || '/';
    res.redirect(url);
}); 

export default router;