import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  const MessageFieldBox({super.key});

  @override
  Widget build(BuildContext context) {

    final focusNode = FocusNode();

    final textController = TextEditingController();

    final outlineInputBorder = UnderlineInputBorder(
        borderSide: const BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.circular(40));

    final inputDecoration = InputDecoration(
        hintText: "Terminal el mensaje con un (?)",
        enabledBorder: outlineInputBorder,
        focusedBorder: outlineInputBorder,
        filled: true,
        suffixIcon: IconButton(
          icon: Icon(Icons.send_rounded),
          onPressed: () {
            final textValue = textController.value.text;
            print("Valor capturado de la caja ${textValue}");
            textController.clear();
          },
        ));

    return TextFormField(
      onTapOutside: (event) {
        focusNode.unfocus();
      },
      focusNode: focusNode,
      controller: textController,
      decoration: inputDecoration,
      onFieldSubmitted: (value) {
        print("Valor capturado: ${value}");
        textController.clear();
        focusNode.requestFocus();
      },
    );
  }
}
