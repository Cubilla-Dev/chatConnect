const app = require('express')();
const server = require('http').createServer(app);
const io = require('socket.io')(server, {
    cors: {
        origin: "*",  
        methods: ["GET", "POST"]
    }
});

const conecciones = {};
const activosConecciones = {};

io.on('connection', socket => {
    console.log('connected');

    socket.on('connectWith', ({ username, userDestinatario }) => {
        // Almacenar el nombre de usuario y el socket en conecciones
        conecciones[username] = socket;
        console.log(username);
        conecciones[userDestinatario] = socket;
        console.log(userDestinatario);

        // Almacenar el nombre de usuario de la persona con la que se quiere conectar
        activosConecciones[username] = userDestinatario;
        activosConecciones[userDestinatario] = username;

        // Notificar a la otra persona de la conexión
        const otherSocket = conecciones[userDestinatario];
        //verificar bien si esta bien esto 
        if (otherSocket) {
            //console.log('esto es othersocket ',otherSocket);
            otherSocket.emit('connectedWith', { username });
        }else{
            console.log('No se encontro el usuario de destino')
        }
    });

    // Aquí puedes manejar otros eventos, como enviar mensajes, etc.
    socket.on('sendMessage', ({ to, message }) => {
        console.log(message);
        // Verificar si el usuario está conectado
        const recipientSocket = conecciones[to];
        if (recipientSocket) {
            recipientSocket.emit('messageReceived', { from: socket.username, message });
        }
    });

    // socket.on('disconnect', () => {
    //     // Eliminar la conexión cuando se desconecta
    //     delete conecciones[socket.username];
    //     delete activosConecciones[socket.username];
    // });
});


module.exports = {server, io}