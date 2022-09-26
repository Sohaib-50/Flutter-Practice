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
  final TextEditingController _controller = TextEditingController();
  String text = '';

  @override
  void initState() {
    super.initState();
    _controller.addListener(_setText);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _setText() {
    String text;
    if (_controller.text.isNotEmpty) {
      text = "Your message is: ${_controller.text}";
    } else {
      text = '';
    }
    setState(() {
      this.text = text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      TextField(
        controller: _controller,
        decoration: const InputDecoration(
          prefixIcon: Icon(Icons.keyboard),
          labelText: 'Enter Message',
        ),
      ),
      Text(text),
    ]);
  }
}
