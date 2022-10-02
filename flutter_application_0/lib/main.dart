import 'package:flutter/material.dart';
import 'myhomepage.dart' show MyHomePage;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sohaib\'s App',
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      home: MyHomePage(),
    );
  }
}
