import 'dart:io';
import 'package:chat_app/config/message.dart';
import 'package:chat_app/presentation/provider/chat_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class ChatSocket extends StatefulWidget {
  final String username = 'Adolfo';

  // const ChatSocket({super.key, required this.username});
  @override
  State<ChatSocket> createState() => _SocketState();
}

class _SocketState extends State<ChatSocket> {
  //variable para el socket
  late IO.Socket _socket;
  //un input de texto
  final TextEditingController _messageInputController = TextEditingController();

  //funcion para mandar los mensajes
  _sendMessage() {
    _socket.emit('message', {
      'message': _messageInputController.text.trim(),
      //'message': 'holaaa',
      'sender': widget.username
    });
    //paa limpiar el input
    _messageInputController.clear();
  }

  //funcion para la conexion
  _connectSocket() {
    _socket.onConnect((data) => print('Connection established'));
    _socket.onConnectError((data) => print('Connect Error, $data'));
    _socket.onDisconnect((data) => print('Socket.IO server disconnected'));
    //mensajes que voy a recibir
    _socket.on(
      'message',
      (data) => Provider.of<ChatProvider>(context, listen: false).addNewMessage(
        Message.formJson(data),
      ),
    );
  }

  //es para cuando quieres montar solo una vez algo
  //cuand inicializa la app por ejemplos variables o lladamas api
  @override
  void initState() {
    super.initState();
    //donde se hace la conexion
    _socket = IO.io(
      'http://192.168.0.14:5000',
      IO.OptionBuilder().setTransports(['websocket']).setQuery(
          {'username': widget.username}).build(),
    );
    _connectSocket();
  }

  //no se que es
  @override
  void dispose() {
    _messageInputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Socket')),
        body: Column(
          children: [
            Expanded(
              child: Consumer<ChatProvider>(
                builder: (_, provider, __) => ListView.separated(
                  padding: const EdgeInsets.all(16),
                  itemBuilder: (context, index) {
                    final message = provider.messages[index];
                    return Wrap(
                      alignment: message.senderUsername == widget.username
                          ? WrapAlignment.end
                          : WrapAlignment.start,
                      children: [
                        Card(
                          color: message.senderUsername == widget.username
                              ? Theme.of(context).primaryColorLight
                              : Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment:
                                  message.senderUsername == widget.username
                                      ? CrossAxisAlignment.end
                                      : CrossAxisAlignment.start,
                              children: [
                                Text(message.message),
                                // Text(
                                //   DateFormat('hh:mm a').format(message.sentAt),
                                //   style: Theme.of(context).textTheme.bodySmall,
                                // )
                              ],
                            ),
                          ),
                        )
                      ],
                    );
                  },
                  separatorBuilder: (_, index) => const SizedBox(
                    height: 5,
                  ),
                  itemCount: provider.messages.length,
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(color: Colors.grey.shade200),
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: SafeArea(
                  child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _messageInputController,
                      decoration: const InputDecoration(
                        hintText: 'Tyoe your message here...',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      if (_messageInputController.text.trim().isNotEmpty) {
                        _sendMessage();
                      }
                    },
                    icon: const Icon(Icons.send),
                  )
                ],
              )),
            ),
          ],
        ));
  }
}
