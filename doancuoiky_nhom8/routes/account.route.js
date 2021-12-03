import express from 'express';

const router = express.Router();

router.get('/register', async function (req, res) {
    res.render('vwAccount/register');
});
// router.get('/login', async function (req, res) {
//     res.render('vwAccount/login');
// });
// router.get('/profile', async function (req, res) {
//     res.render('vwAccount/profile');
// });
export default router;