import 'package:chat_app/config/message.dart';
import 'package:flutter/material.dart';

class ChatProvider extends ChangeNotifier {
  final List<Message> _message = [];
  List<Message> get message => _message;

  addNewMessage(Message message) {
    _message.add(message);
    notifyListeners();
  }
}
