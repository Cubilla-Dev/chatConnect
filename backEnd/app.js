const express = require('express');
const app = express();
const http = require('http');
const server = http.createServer(app);
const { Server } = require("socket.io");
const io = new Server(server);

const morgan = require('morgan')
const router = require('./src/routers/auntenticacion')
const db_sequelize = require('./src/config/conexionSequelize')
const cors = require('cors')

//config
app.use(express.json());
//seguridad
app.use(cors("*"));
//middleware
app.use(morgan("dev"));
//routes
app.use(router);
//sincronizacion de la base de datos
db_sequelize.sync()
    .then(()=>{
        console.log('Base de datos sincronizada')
    })
    .catch((error)=>{
        console.error('Error en la sincronizacion a la base de datos ', error)
    })

const messages = [];
// const conecciones = {};
// const activosConecciones = {};

io.on('connection', (socket) => {
    console.log('connected');
    const username = socket.handshake.query.username
    socket.on('message', (data) => {
        const message = {
            message: data.message,
            senderUsername: username,
            sentAt: Date.now()
        }
        console.log('llego el sms')
        messages.push(message)
        console.log(message)
        io.emit('message', message)
    })
})



server.listen(5000, ()=>{
    console.log('Servidor en linea en el puerto')
})
