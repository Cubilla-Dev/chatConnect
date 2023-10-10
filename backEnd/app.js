const app = require('express')
const {server} = require('./src/util/conexionSocket')
const Sequelize = require('./src/util/config')
// const router = require('./src/routers/chat')

// app.user(router)

// Sequelize
//     .authenticate()
//     .then(()=>{
//         console.log('Conexion exitosa con el db')
//     })
//     .catch((error)=>{
//         console.error('No se pudo conectar con la base de datos ', error)
//     })


server.listen(4000, () => console.log('listening on 127.0.0.1:4000'));
