import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PlatFormProvider with ChangeNotifier {
  List<String> _onBoardingText = [];
  GlobalKey _code = GlobalKey();
  // Depending on the which widget is clicked
  List<String> get onBoardingText => _onBoardingText;
  GlobalKey get code => _code;

  void getYoutube() {
    _code = GlobalKey();
    _onBoardingText.clear();
    _onBoardingText.add("What is your Youtube Channel ID");
    _onBoardingText.add("Channel ID");
    _onBoardingText.add(
        "Put this code into your Youtube Bio: ${_code.toString().replaceAll("[GlobalKey#", "").replaceAll("]", "")}");
    notifyListeners();
  }

  void getTiktok() {
    _code = GlobalKey();
    _onBoardingText.clear();
    _onBoardingText.add("What is your TikTok Username");
    _onBoardingText.add("Username");
    _onBoardingText.add(
        "Put this code into your TikTok Bio: ${_code.toString().replaceAll("[GlobalKey#", "").replaceAll("]", "")}");
    notifyListeners();
  }

  void getTwitch() {
    _code = GlobalKey();
    _onBoardingText.clear();
    _onBoardingText.add("What is your Twitch Username");
    _onBoardingText.add("Username");
    _onBoardingText.add(
        "Put this code into your Twitch Bio: ${_code.toString().replaceAll("[GlobalKey#", "").replaceAll("]", "")}");
    notifyListeners();
  }

  void getInstagram() {
    _code = GlobalKey();
    _onBoardingText.clear();
    _onBoardingText.add("What is your Instagram Username");
    _onBoardingText.add("Username");
    _onBoardingText.add(
        "Put this code into your Instagram Bio: ${_code.toString().replaceAll("[GlobalKey#", "").replaceAll("]", "")}");
    notifyListeners();
  }

  void checkYoutube(youtubeId) {
    // this will webscrape youtube bio with the channel id and see if the
    // bio has the code
  }
}
