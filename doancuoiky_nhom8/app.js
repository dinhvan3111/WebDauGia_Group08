import express from 'express'
import morgan from 'morgan';
import { dirname } from 'path';
import { fileURLToPath } from 'url';
const __dirname = dirname(fileURLToPath(import.meta.url));
import dotenv from 'dotenv';
dotenv.config();

import viewMdw from './middlewares/view.mdw.js';
import localMdw from './middlewares/locals.mdw.js';
import routeMdw from './middlewares/routes.mdw.js'



const app = express();

const port = process.env.PORT || 3000;

app.use(morgan('dev'));
app.use(express.urlencoded({
    extended: true
}));
app.use(express.json({
  type: "*/*"
}))
app.use(express.static(__dirname + '/public'));

viewMdw(app);
localMdw(app);
routeMdw(app);

app.listen(port, function () {
    console.log(`Web app listening at http://localhost:${port}`)
})

