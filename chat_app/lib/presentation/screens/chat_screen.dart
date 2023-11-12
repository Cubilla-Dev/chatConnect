import 'package:chat_app/presentation/widgets/textBox.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(4.0),
          child: CircleAvatar(
            //poner la url para la imagen de fondo
            backgroundImage: NetworkImage('url'),
          ),
        ),
        title: const Text('noombre de usuario'),
        centerTitle: false,
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  const _ChatView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ScrollController chatScrollController = ScrollController();
    //cambiar a otro lado esto no funciona todavia
    //se le tiene que llamar
    void moveScrollToBottom() async {
      await Future.delayed(Duration(milliseconds: 100));
      chatScrollController.animateTo(
          chatScrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut);
    }

    return SafeArea(
      child: Column(
        children: [
          Expanded(
              child: ListView.builder(
            controller: chatScrollController,
            itemBuilder: (context, index) {
              //mensaje a mostrar
              final message = Text('Mensaje recibido');
              return;
            },
          )),
          //caja de texto
          TextBox(onValue: (value) {})
        ],
      ),
    );
  }
}
