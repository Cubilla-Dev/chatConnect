'use strict';
const io = require('socket.io-client');

var socket = io('ws://127.0.0.1:4000', {
    transports: ['websocket'],
    autoConnect: false
});
socket.on('connect', function(){
    console.log('connect');
    socket.emit('message', 'hi')
});
socket.connect();
socket.on('connect_error', function(){console.log('connect_error')});
socket.on('event', function(data){});
socket.on('fromServer', function(data){console.log(data)});
socket.on('disconnect', function(){console.log('disconnect')});