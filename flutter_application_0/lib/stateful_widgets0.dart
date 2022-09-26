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

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Sohaib's App")),
      body: MessageInputWidget(),
    );
  }
}

class MessageInputWidget extends StatefulWidget {
  const MessageInputWidget({super.key});

  @override
  State<MessageInputWidget> createState() => _MessageInputWidgetState();
}

class _MessageInputWidgetState extends State<MessageInputWidget> {
  String text = '';

  void changeText(String value) {
    if (value.isNotEmpty) {
      value = "Your message is: $value";
    }
    setState(() {
      text = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      TextField(
        decoration: const InputDecoration(
          prefixIcon: Icon(Icons.keyboard),
          labelText: 'Enter Message',
        ),
        onChanged: ((value) => changeText(value)),
      ),
      Text(this.text)
    ]);
  }
}
