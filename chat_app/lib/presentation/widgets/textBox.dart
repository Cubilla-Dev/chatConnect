import 'package:flutter/material.dart';

class TextBox extends StatelessWidget {
  //se le pasa el valor del input
  final ValueChanged<String> onValue;

  const TextBox({super.key, required this.onValue});

  void sendMessage(String message) {
    print(message);
  }

  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();
    final focusNode = FocusNode();
    //variable para decoracion
    final outlineInputBorder = UnderlineInputBorder(
        borderSide: const BorderSide(color: Color.fromARGB(255, 118, 13, 13)),
        borderRadius: BorderRadius.circular(40));
    final inputDecoration = InputDecoration(
        hintText: 'texto a mostrar',
        enabledBorder: outlineInputBorder,
        focusedBorder: outlineInputBorder,
        //para rellenar el fondo del input
        filled: true,
        suffixIcon: IconButton(
            onPressed: () {
              final textValue = textController.value.text;
              textController.clear();
              sendMessage(textValue);
            },
            icon: const Icon(Icons.send)));
    return TextFormField(
      //a que cuando ahagamos click afuera el focus se le quitara y para asi esconderse el teclado
      onTapOutside: (event) {
        focusNode.unfocus();
      },
      focusNode: focusNode,
      controller: textController,
      decoration: inputDecoration,
      onFieldSubmitted: (value) {
        //a que cuando se limpiar se tiene que quedar el focus ahi en el input
        focusNode.requestFocus();
        textController.clear();
        onValue(value);
      },
    );
  }
}
