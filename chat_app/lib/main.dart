import 'package:chat_app/presentation/screens/chat_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat',
      debugShowCheckedModeBanner: false,
      //esto podria pasar a una clase para ponerle diferentes colores
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.red),
      home: const ChatScreen(),
    );
  }
}
