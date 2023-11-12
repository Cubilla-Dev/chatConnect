import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:dio/dio.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [Campos()],
      ),
    );
  }
}

class Campos extends StatelessWidget {
  const Campos({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    TextEditingController correoController = TextEditingController();
    TextEditingController contraController = TextEditingController();

    void sendLogin() async {
      final Map<String, dynamic> dataRegister = {
        "password": contraController.text,
        "email": correoController.text,
      };

      try {
        //falta obtener el token y guardarlo
        final Response response = await Dio()
            .post('http://192.168.0.14:5000/login', data: dataRegister);
        print("La data fue enviada. Estado: ${response.statusCode}");
      } catch (error) {
        print("Error al enviar la data: $error");
      }
    }

    return Expanded(
      child: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Image.network(
              'https://logowik.com/content/uploads/images/flutter5786.jpg'),
          SizedBox(
            height: 20,
          ),
          Text(
            'Chat App',
            style: TextStyle(fontSize: 50),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
              child: Padding(
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            child: Column(
              children: [
                TextFormField(
                    controller: correoController,
                    decoration: InputDecoration(
                        labelText: 'Correo',
                        hintText: 'Ingresa su correo',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        contentPadding: EdgeInsets.all(10))),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: contraController,
                  decoration: InputDecoration(
                      labelText: 'Contraseña',
                      hintText: 'Ingresa su correo',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      contentPadding: EdgeInsets.all(10)),
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Ingresar', style: TextStyle(fontSize: 20)),
                  style: ElevatedButton.styleFrom(minimumSize: Size(150, 40)),
                ),
                RichText(
                    text: TextSpan(
                  text: 'Registrarse',
                  style: TextStyle(color: Colors.blue),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      context.go('/register');
                    },
                ))
              ],
            ),
          ))
        ],
      ),
    );
  }
}
