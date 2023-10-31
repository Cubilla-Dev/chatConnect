import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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

  @override
  Widget build(BuildContext context) {
    TextEditingController nombreController = TextEditingController();
    TextEditingController apelidoController = TextEditingController();
    TextEditingController correoController = TextEditingController();
    TextEditingController contraController = TextEditingController();
    TextEditingController verifiContraController = TextEditingController();
    return Expanded(
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
                  controller: apelidoController,
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
                  onPressed: () {},
                  child:
                      const Text('Registrarse', style: TextStyle(fontSize: 20)),
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
                            context.go('/');
                          }))
              ],
            ),
          ))
        ],
      ),
    );
  }
}
