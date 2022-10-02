import 'package:flutter/material.dart';
import 'myhomepage.dart' show MyHomePage;

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text("Login")), body: Body());
  }
}

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  late String name;
  final textController = TextEditingController();

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  void login() {
    name = textController.text;
    if (name.isNotEmpty) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => MyHomePage(
                    name: name,
                  )));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
          padding: const EdgeInsets.all(100),
          child: TextField(
            controller: textController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              prefixIcon: const Icon(Icons.person),
              labelText: 'Enter Name',
              suffixIcon: IconButton(
                  icon: const Icon(Icons.check),
                  splashColor: Colors.blue,
                  tooltip: "Login",
                  onPressed: login),
            ),
          )),
    );
  }
}
