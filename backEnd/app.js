const express = require('express');
const app = express();
const http = require('http');
const server = http.createServer(app);
const { Server } = require("socket.io");
const io = new Server(server);
// const io = require('socket.io')(server, {
//     cors: {
//         origin: "*",  
//         methods: ["GET", "POST"]
//     }
// });

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
    console.log('Sservidor en linea en el puert0 3000')
})