const { Sequelize } = require('sequelize');
const config = require('./config');
require('dotenv').config();


    const db_sequelize = new Sequelize(
        config[process.env.NODE_ENV].name, 
        config[process.env.NODE_ENV].user,  
        config[process.env.NODE_ENV].db_pass, 
        {
            host: config[process.env.NODE_ENV].host,
            dialect: 'mysql',  // config[process.env.NODE_ENV].dialect,
            port: config[process.env.NODE_ENV].port_db
    });


module.exports = db_sequelize;