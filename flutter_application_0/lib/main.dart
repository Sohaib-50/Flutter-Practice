import 'package:flutter/material.dart';

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
        primarySwatch: Colors.amber,
        // visualDensity: VisualDensity.adaptivePlatformDensity;
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
      body: Column(
        children: [
          SohaibText(),
          Divider(),
          SohaibText(),
          Divider(),
          SohaibText(),
          Divider(),
          SohaibText(),
          Divider(),
          SohaibText(),
          Divider(),
          SohaibText(),
          Divider()
        ],
      ),
    );
  }
}

class SohaibText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Sohaib's Text"),
    );
  }
}
