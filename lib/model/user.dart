import 'package:flutter/cupertino.dart';

class User {
  // Changable by user
  final String imagepath;
  final String name;
  final String email;
  final String contentType;

  // NOT changable by user
  final int tiktokFollowCount;
  final int twitchFollowCount;
  final int youtubeFollowCount;
  final int instagramFollowCount;

  const User({
    required this.imagepath,
    required this.name,
    required this.email,
    required this.contentType,
    required this.instagramFollowCount,
    required this.twitchFollowCount,
    required this.tiktokFollowCount,
    required this.youtubeFollowCount,
  });
}

// final user = User(
//   imagepath: "",
//   name: "j",
//   email: "",
//   contentType: "",
//   instagramFollowCount: 1,
//   twitchFollowCount: 1,
//   tiktokFollowCount: 1,
//   youtubeFollowCount: 1
// );

// dynamic imgpath = user.imagepath;

// void getImgPath(){
//   return imgpath;
// }