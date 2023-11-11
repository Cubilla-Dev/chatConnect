const { Sequelize } = require('sequelize');
const config = require('./config');
require('dotenv').config();

const connectDatabase = () =>{
    const db_sequelize = new Sequelize(
        config[process.env.NODE_ENV].name, 
        config[process.env.NODE_ENV].user,  
        config[process.env.NODE_ENV].db_pass, 
        {
            host: config[process.env.NODE_ENV].host,
            dialect: config[process.env.NODE_ENV].dialect,
            port: config[process.env.NODE_ENV].port_db
    });
    return db_sequelize
        .authenticate()
        .then(()=>{
            console.log('Conexion a la base de datos exitosa')
        })
        .catch((error)=>{
            console.error('No se pudo conectar a la base de datos ', error)
        })
};

module.exports = connectDatabase;