import knexModel from 'knex';
import envVar from './envVar.js';


export const connectionInfo = {
	host: envVar.DB_HOST,
	port: envVar.DB_PORT,
	user: envVar.DB_USER,
	password: envVar.DB_PASS,
	database: envVar.DB_NAME
};
const knex = knexModel({
	client: 'mysql2',
	connection: connectionInfo,
	pool: {min: 0, max: 10}
});


export default knex;