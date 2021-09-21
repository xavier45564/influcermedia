import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GreetingProvider with ChangeNotifier {
  GreetingProvider(){
    getGreetingNow();
  }
  String _greeting = '';

  String get greeting => _greeting;

  void getGreeting() {
    var hour = DateTime.now().hour;
    if (hour <= 12) {
      _greeting = 'Morning';
      notifyListeners();
    }
    if (hour <= 17) {
      _greeting = 'Afternoon';
      notifyListeners();
    } else {
      _greeting = 'Evening';
      notifyListeners();
    }
    notifyListeners();
  }

  Future getGreetingNow() async{
    getGreeting();
    return _greeting;
  }
}
