import 'package:flutter/material.dart';
import 'post.dart' show Post;
import 'postlist.dart' show PostsList;
import 'postinputwidget.dart' show PostInputWidget;

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Post> posts = [];

  void newPost(String text) {
    setState(() {
      posts.add(Post(text, "Sohaib"));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Sohaib's App")),
      body: Column(
          // ignore: prefer_const_constructors
          children: [
            Expanded(child: PostsList(posts)),
            PostInputWidget(newPost)
          ]),
    );
  }
}
