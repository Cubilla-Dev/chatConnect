import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart';

class ChatSocket extends StatefulWidget {
  @override
  State<ChatSocket> createState() => _SocketState();
}

class _SocketState extends State<ChatSocket> {
  late Socket socket;

  // const Socket({super.key});
  @override
  void initState() {
    super.initState();
    socket = io('http://192.168.0.4:4000');
    socket.connect();
    socket.on('connect', (_) {
      print('Connected to the  server');
    });
  }

  Future<void> sendMessage(String message) async {
    socket.emit('chat_message', message);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Socke')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    sendMessage('Hola, server');
                  },
                  child: Text('Se envio mensaje'))
            ],
          ),
        ),
      ),
    );
  }
}
