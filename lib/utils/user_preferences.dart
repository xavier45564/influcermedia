import 'package:flutter/cupertino.dart';
import 'package:influencermedia/model/user.dart';
import 'package:firebase_storage/firebase_storage.dart';

class UserPreferences {
  static const myUser = User(
      imagepath: "",
      name: "",
      email: "",
      contentType: "",
      youtubeFollowCount: 0,
      instagramFollowCount: 0,
      tiktokFollowCount: 0,
      twitchFollowCount: 0);
}

class FireStoreStorageService extends ChangeNotifier {
  FireStoreStorageService();
  static Future<dynamic> loadImage(BuildContext, String Image) async {
    return await FirebaseStorage.instance.ref().child(Image).getDownloadURL();
  }
}

Future<Widget> _getImage(BuildContext context, String imageName) async {
  Image image = Image.asset("assets/images/avatar.png");
  await FireStoreStorageService.loadImage(context, imageName).then((value) => {
        image = Image.network(
          value.toString(),
          fit: BoxFit.scaleDown,
        )
      });
  return image;
}
