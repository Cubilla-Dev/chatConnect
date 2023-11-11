const dotenv = require('dotenv');
dotenv.config();

const config = {
    development: {
        port: process.env.PORT,
        email: process.env.EMAIL_DEVEPLOMENET,
        pass: process.env.PASS_DEVEPLOMENET,
        jwt_secret: process.env.JWT_SECRECT,
        name: process.env.NAME_DB_DEVELOPMENT,
        user: process.env.USER_DB_DEVELOPMENT,
        db_pass: process.env.PASS_DB_DEVELOPMENT,
        host: process.env.HOST_DEVELOPMENT,
        dialect: process.env.DIALECT_DEVELOPMENT,
        port_db: process.env.PORT_DB_DEVELOPMENT

    },
    production: {
        port: process.env.PORT,
        email: process.env.EMAIL_PRODUCTION,
        pass: process.env.PASS_PRODUCTION,
        jwt_secret: process.env.JWT_SECRECT,
        name: process.env.NAME_DB_PRODUCTION,
        user: process.env.USER_DB_PRODUCTION,
        db_pass: process.env.PASS_DB_PRODUCTION,
        host: process.env.HOST_PRODUCTION,
        dialect: process.env.DIALECT_PRODUCTION,
        port_db: process.env.PORT_DB_PRODUCTION
    }
}

module.exports = config;