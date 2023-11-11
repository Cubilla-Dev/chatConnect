const { Sequelize } = require("sequelize");

const User = Sequelize.define('user',{
    id_user: {
        type: Sequelize.INTEGER,
        primaryKey: true
    },
    name: {
        type: Sequelize.STRING,
        allowNull: false
    },
    lastname:{
        type:Sequelize.STRING,
        allowNull: false
    },
    email: {
        type: Sequelize.STRING,
        allowNull: false
    },
    passHash: {
        type: Sequelize.STRING,
        allowNull: false
    },
})

module.exports = User;