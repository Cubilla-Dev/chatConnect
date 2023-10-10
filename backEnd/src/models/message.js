const { Sequelize } = require("sequelize");

const Message = Sequelize.define('message',{
    id_sms: {
        type: Sequelize.INTEGER,
        primaryKey: true
    },
    remitente: {
        type: Sequelize.STRING,
        allowNull: false
    },
    destinatario: {
        type: Sequelize.STRING,
        allowNull: false
    },
    texto: {
        type: Sequelize.STRING,
        allowNull: false
    },
    fecha: {
        type: Sequelize.DATE,
        allowNull: false
    },
    hora: {
        type: Sequelize.STRING,
        allowNull: false
    }
})

//falta la conexion con la tabla de user
