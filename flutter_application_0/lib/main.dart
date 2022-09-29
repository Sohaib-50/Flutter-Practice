import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sohaib\'s App',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String text = "";

  void changeText(String newText) {
    setState(() {
      text = newText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Sohaib's App")),
      body: Column(children: [MessageInputWidget(changeText), Text(this.text)]),
    );
  }
}

class MessageInputWidget extends StatefulWidget {
  final Function(String) callback;

  const MessageInputWidget(this.callback, {super.key});

  @override
  State<MessageInputWidget> createState() => _MessageInputWidgetState();
}

class _MessageInputWidgetState extends State<MessageInputWidget> {
  final textController = TextEditingController();

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  void saveClicked() {
    widget.callback(textController.text);
    textController.clear();
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
          splashColor: Colors.blueGrey,
          tooltip: "Save post",
          onPressed: saveClicked,
        ),
      ),
    );
  }
}
