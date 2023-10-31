// import 'package:chat_app/presentation/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:chat_app/presentation/provider/chat_provider.dart';
import 'package:provider/provider.dart';
import 'package:chat_app/config/router.dart';

void main() async {
  // await dotenv.load();
  //es para llamar el provider y para asi que este globalmente
  runApp(ChangeNotifierProvider(
    create: (_) => ChatProvider(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat',
      debugShowCheckedModeBanner: false,
      //esto podria pasar a una clase para ponerle diferentes colores
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.amber),
      home: MaterialApp.router(routerConfig: router),
    );
  }
}
