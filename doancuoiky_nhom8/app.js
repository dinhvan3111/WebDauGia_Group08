import express from 'express'
import morgan from 'morgan';
import { dirname } from 'path';
import { fileURLToPath } from 'url';
const __dirname = dirname(fileURLToPath(import.meta.url));
import envVar from './utils/envVar.js';
import timers from './models/timers.model.js';
import sessionMdw from './middlewares/session.mdw.js';


import viewMdw from './middlewares/view.mdw.js';
import localMdw from './middlewares/locals.mdw.js';
import routeMdw from './middlewares/routes.mdw.js'



const app = express();

const port = envVar.PORT;

app.use(morgan('dev'));
// app.use(express.urlencoded({
//     extended: true
// }));
// app.use(express.json({
//   type: "*/*"
// }))
app.use(express.static(__dirname + '/public'));


sessionMdw(app);
viewMdw(app);
localMdw(app);
routeMdw(app);

app.listen(port, async function () {
    console.log(`Web app listening at http://localhost:${port}`);
    // console.log('Timer is starting check ... at here');
    // await timers.run();
});

