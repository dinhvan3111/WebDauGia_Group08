import express from 'express'
import morgan from 'morgan';
import { dirname } from 'path';
import { fileURLToPath } from 'url';

import viewMdw from './middlewares/view.mdw.js';
import localMdw from './middlewares/locals.mdw.js';

import categoryRoute from './routes/category.route.js';
import accountRoute from './routes/account.route.js';

const __dirname = dirname(fileURLToPath(import.meta.url));
const app = express();

const port = 3000

app.use(morgan('dev'));
app.use(express.static(__dirname + '/public'));

viewMdw(app);
localMdw(app);


app.get('/', function (req, res) {
    res.render('home');
});

app.get('/bs4', function (req, res) {
    res.sendFile( __dirname + '/bs4.html');
})

app.listen(port, function () {
    console.log(`Web app listening at http://localhost:${port}`)
})

app.use('/category', categoryRoute);
app.use('/account', accountRoute);
