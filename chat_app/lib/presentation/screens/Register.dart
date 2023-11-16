import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:dio/dio.dart';
import 'dart:convert' as convert;

import 'package:http/http.dart' as http;
import 'package:chat_app/presentation/util/httpFunction.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
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
  final TextEditingController nombreController = TextEditingController();
  final TextEditingController apellidoController = TextEditingController();
  final TextEditingController correoController = TextEditingController();
  final TextEditingController contraController = TextEditingController();
  final TextEditingController verifiContraController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // void sendRegister() async {
    //   final Map<String, dynamic> dataRegister = {
    //     "name": nombreController.text,
    //     "lastname": apellidoController.text,
    //     "password": contraController.text,
    //     "email": correoController.text,
    //     "verifiPassword": verifiContraController.text,
    //   };
    //   print('Es la data recolectada del forulario $dataRegister');
    //   try {
    //     final Response response = await Dio()
    //         .post('http://192.168.0.14:5000/register', data: dataRegister);
    //     print("La data fue enviada. Estado: ${response.statusCode}");
    //   } catch (error) {
    //     print("Error al enviar la data: $error");
    //   }
    // }
    void sendRegister() async {
      final Map<String, dynamic> dataRegister = {
        "name": nombreController.text,
        "lastname": apellidoController.text,
        "email": correoController.text,
        "password": contraController.text,
        "verifiPassword": verifiContraController.text,
      };

      // Crea un objeto http.Request
      final request =
          http.Request('POST', Uri.parse('http://192.168.0.14:5000/register'));

      // Configura el cuerpo de la solicitud
      request.body = dataRegister.toString();

      // Envía la solicitud
      final response = await request.send();

      // Maneja la respuesta
      if (response.statusCode == 200) {
        // La data fue enviada correctamente
        print('La data fue enviada. Estado: ${response.statusCode}');
      } else {
        // Ocurrió un error al enviar la data
        print('Error al enviar la data: ${response.statusCode}');
      }
    }

    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Image.network(
              'https://logowik.com/content/uploads/images/flutter5786.jpg',
              width: 100,
              height: 100,
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              'Crear cuenta',
              style: TextStyle(fontSize: 50),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
                child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    TextFormField(
                        controller: nombreController,
                        decoration: InputDecoration(
                            labelText: 'Nombre',
                            hintText: 'Ingresa su nombre',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            contentPadding: const EdgeInsets.all(10))),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: apellidoController,
                      decoration: InputDecoration(
                          labelText: 'Apellido',
                          hintText: 'Ingresa su Apellido',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          contentPadding: const EdgeInsets.all(10)),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                        controller: correoController,
                        decoration: InputDecoration(
                            labelText: 'Correo',
                            hintText: 'Ingresa su correo',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            contentPadding: const EdgeInsets.all(10))),
                    const SizedBox(
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
                          contentPadding: const EdgeInsets.all(10)),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: verifiContraController,
                      decoration: InputDecoration(
                          labelText: 'Contraseña',
                          hintText: 'Ingresa de nuevo su contraseña',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          contentPadding: const EdgeInsets.all(10)),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      //?boton para enviar el registro
                      onPressed: () async {
                        // Guarda el BuildContext antes de entrar en el contexto asíncrono
                        final currentContext = context;
                        //sendRegister();
                        if (formKey.currentState!.validate()) {
                          Map<String, dynamic> info = {
                            "name": nombreController.text,
                            "lastname": apellidoController.text,
                            "email": correoController.text,
                            "password": contraController.text,
                            "verifiPassword": verifiContraController.text,
                          };
                          const apiUrl = '192.168.0.14:5000';
                          try {
                            //!
                            final datos = await fetchData(apiUrl, info);
                            print('los datos de la peticion son $datos');

                            //?para limpiar los inputs
                            // nombreController.clear();
                            // apellidoController.clear();
                            // correoController.clear();
                            // contraController.clear();
                            // verifiContraController.clear();
                            if (datos['status'] == 200) {
                              showDialog(
                                  context: currentContext,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: const Text('Prueba'),
                                      content: const Text(
                                          'El registro se ha realizado con éxito'),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            // Limpia los campos del formulario
                                            nombreController.clear();
                                            apellidoController.clear();
                                            correoController.clear();
                                            contraController.clear();
                                            verifiContraController.clear();

                                            // Redirige a la página de inicio de sesión
                                            context.go('/login');
                                          },
                                          child: Text('Aceptar'),
                                        ),
                                      ],
                                    );
                                  });
                              // context.go('/login');
                              // Text('${datos['status']}');
                            }
                          } catch (error) {
                            print(
                                'Hubo error en la peticion en registro $error');
                          }
                        }
                      },
                      child: const Text('Registrarse',
                          style: TextStyle(fontSize: 20)),
                      style: ElevatedButton.styleFrom(
                          minimumSize: const Size(150, 40)),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    RichText(
                        text: TextSpan(
                            text: 'Inicio Sesion',
                            style: const TextStyle(color: Colors.blue),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                context.go('/login');
                              }))
                  ],
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
