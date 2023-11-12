const { DataTypes } = require('sequelize');
const db_sequelize = require('../config/conexionSequelize')

const User = db_sequelize.define('user_register',{
    id_user: {
        type: DataTypes.INTEGER,
        autoIncrement: true,
        primaryKey: true
    },
    name: {
        type: DataTypes.STRING,
        allowNull: false
    },
    lastname:{
        type:DataTypes.STRING,
        allowNull: false
    },
    email: {
        type: DataTypes.STRING,
        allowNull: false
    },
    passHash: {
        type: DataTypes.STRING,
        allowNull: false
    },
})

module.exports = User;