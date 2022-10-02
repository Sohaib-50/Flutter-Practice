import 'package:flutter/material.dart';
import 'post.dart' show Post;

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
