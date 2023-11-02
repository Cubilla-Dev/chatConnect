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


server.listen(4000, '192.168.0.4', () => {
    console.log('Listening on 192.168.0.4:4000');
});


//para ahcer tareas automatizadas
// import cron from "node-cron"; 
// import {redisSave} from "./redisSave.js" 
// import {socketServices} from "../services/socketService.js" 
// import {cointGenerate} from "./cointGenerator.js" 
// import client from "../db/db-config.js"; 
// const respawn=async()=>{      
//     const room=JSON.parse(await client.get('room'))      
//     let job1 = cron.schedule('0 /1 * *',async() => {                  
//         if(room){                 
//             //obtiene todas las salas             
//             const cointNumber=room.coins_to_generate             
//             const area=room.area_3D             
//             const cointUbication=cointGenerate(cointNumber,area)                          
//             //agrega las monedas a la sala             
//             room.cointUbication=cointUbication             
//             const serializer=JSON.stringify(room)             
//             //guardado en la base de datos             
//             redisSave("room",serializer)             
//             socketServices("respwn-coint","se genero un nuevo set de monedas","emit")             
//             console.log("Nuevo set monedas");             
//         }        
//     });             
//     job1.start();
// }