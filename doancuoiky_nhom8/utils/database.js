import knexModel from 'knex';
import dotenv from 'dotenv';
dotenv.config();

const knex = knexModel({
	client: 'mysql2',
	connection: {
		host: process.env.DB_HOST,
		port: process.env.DB_PORT,
		user: process.env.DB_USER,
		password: process.env.DB_PASS,
		database: process.env.DB_NAME
	},
	pool: {min: 0, max: 10}
});

export default knex;