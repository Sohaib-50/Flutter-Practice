import 'package:flutter/material.dart';

class PostInputWidget extends StatefulWidget {
  final Function(String) callback;

  const PostInputWidget(this.callback, {super.key});

  @override
  State<PostInputWidget> createState() => _PostInputWidgetState();
}

class _PostInputWidgetState extends State<PostInputWidget> {
  final textController = TextEditingController();

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  void saveClicked() {
    if (textController.text.isNotEmpty) {
      widget.callback(textController.text);
      textController.clear();
      FocusScope.of(context).unfocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textController,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.keyboard),
        labelText: 'Enter Message',
        suffixIcon: IconButton(
          icon: const Icon(Icons.send),
          splashColor: Colors.blue,
          tooltip: "Save post",
          onPressed: saveClicked,
        ),
      ),
    );
  }
}
