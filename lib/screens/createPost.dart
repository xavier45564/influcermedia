import 'package:flutter/material.dart';
import 'package:influencermedia/app/constraints.dart';

class CreatePost extends StatefulWidget {
  const CreatePost({Key? key}) : super(key: key);

  @override
  _CreatePostState createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        // just make it a button that as soon as you press
        // the post button it'll send u to the gallery 
        // and then it will ask u to make a caption
        child: Text("CreatePost"),
      ),
    );
  }
}
