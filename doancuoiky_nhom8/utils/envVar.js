import dotenv from 'dotenv';
dotenv.config();

const envVar = {
	DB_HOST: process.env.DB_HOST,
	DB_PORT: process.env.DB_PORT,
	DB_USER: process.env.DB_USER,
	DB_PASS: process.env.DB_PASS,
	DB_NAME: process.env.DB_NAME,
	PORT: process.env.PORT,
	CAPTCHA_PUBLIC_KEY: process.env.CAPTCHA_PUBLIC_KEY,
	CAPTCHA_PRIVATE_KEY: process.env.CAPTCHA_PRIVATE_KEY,
	FB_APP_ID: process.env.FB_APP_ID,
	FB_APP_SECRET: process.env.FB_APP_SECRET,
	FB_CALLBACK_URL: process.env.FB_CALLBACK_URL,
	GG_CLIENT_ID: process.env.GG_CLIENT_ID,
	GG_CLIENT_SECRET: process.env.GG_CLIENT_SECRET,
	GG_CALLBACK_URL: process.env.GG_CALLBACK_URL,
	FROM_EMAIL: process.env.FROM_EMAIL,
	SENDGRID_API_KEY: process.env.SENDGRID_API_KEY,
	SENDGRID_VERIFY_EMAIL_TEMPLATE: process.env.SENDGRID_VERIFY_EMAIL_TEMPLATE,
	SENDGRID_FORGOT_PWD_TEMPLATE: process.env.SENDGRID_FORGOT_PWD_TEMPLATE,
	SENDGRID_TRANSACTION_TEMPLATE: process.env.SENDGRID_TRANSACTION_TEMPLATE
};


export default envVar;
