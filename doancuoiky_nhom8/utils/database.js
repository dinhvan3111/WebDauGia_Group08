import knexModel from 'knex';
const knex = knexModel({
	client: 'mysql2',
	connection: {
		host: '127.0.0.1',
		port: 3306,
		user: 'root',
		password: '',
		database: 'qldaugia'
	},
	pool: {min: 0, max: 10}
});

export default knex;