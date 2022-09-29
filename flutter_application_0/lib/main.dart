import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class Post {
  String body;
  String author;
  int likes = 0;
  bool userLiked = false;

  // Constructor
  Post(this.body, this.author);

  void userClickLike() {
    userLiked = !userLiked;
    if (userLiked) {
      likes += 1;
    } else {
      likes -= 1;
    }
  }
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
          splashColor: Colors.blueGrey,
          tooltip: "Save post",
          onPressed: saveClicked,
        ),
      ),
    );
  }
}

class PostsList extends StatefulWidget {
  final List<Post> posts;

  const PostsList(this.posts, {super.key});

  @override
  State<PostsList> createState() => _PostsListState();
}

class _PostsListState extends State<PostsList> {
  void likePost(Function callback) {
    setState(() {
      callback();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.posts.length,
      itemBuilder: (BuildContext context, int index) {
        var post = widget.posts[index];
        return Card(
          child: Row(children: [
            // post body and author
            Expanded(
                child: ListTile(
                    title: Text(post.body), subtitle: Text(post.author))),
            // like button and number of likes
            Column(children: [
              // like button
              IconButton(
                  onPressed: () => likePost(post.userClickLike),
                  // heart icon, filled if user liked, empty if not
                  icon: Icon(
                      post.userLiked ? Icons.favorite : Icons.favorite_border),
                  color: post.userLiked ? Colors.blueGrey : null),
              // number of likes
              Text(
                post.likes.toString(),
                style: TextStyle(fontSize: 15),
              )
            ])
          ]),
        );
      },
    );
  }
}
