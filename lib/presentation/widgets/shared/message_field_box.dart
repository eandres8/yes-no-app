import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  final ValueChanged<String> onValue;

  const MessageFieldBox({super.key, required this.onValue });

  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();
    final focurNode = FocusNode();

    // styles
    final outlineInputBorder = OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.transparent),
      borderRadius: BorderRadius.circular(40),
    );
    final inputDecoration = InputDecoration(
      filled: true,
      hintText: 'End your message with a "?"',
      contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      enabledBorder: outlineInputBorder,
      focusedBorder: outlineInputBorder,
      suffixIcon: IconButton(
        icon: const Icon(Icons.send_outlined),
        onPressed: () {
          final textValue = textController.value.text;
          onValue(textValue);
          textController.clear();
        },
      ),
    );

    return TextFormField(
      onTapOutside: (event) => focurNode.unfocus(),
      focusNode: focurNode,
      controller: textController,
      decoration: inputDecoration,
      onFieldSubmitted: (value) {
        onValue(value);
        textController.clear();
        focurNode.requestFocus();
      },
    );
  }
}
