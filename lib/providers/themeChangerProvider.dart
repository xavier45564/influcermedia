import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:influencermedia/app/global.dart';
import 'package:influencermedia/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  late ThemeData _selectedTheme;
  late Typography defaultTypography;
  late SharedPreferences prefs;
  bool _currentTheme = isDarkTheme;

  bool get currentTheme => _currentTheme;
  
  ThemeData dark = ThemeData.dark().copyWith(
  );

  ThemeData light = ThemeData.light().copyWith(
    appBarTheme: AppBarTheme(backgroundColor: Colors.white, textTheme: TextTheme(headline1: TextStyle(color: Colors.black))),
  );

  ThemeProvider(bool darkThemeOn) {
    _selectedTheme = darkThemeOn ? dark : light;
  }

  Future<void> swapTheme() async {
    prefs = await SharedPreferences.getInstance();

    if (_selectedTheme == dark) {
      _selectedTheme = light;
      _currentTheme = false;
      isDarkTheme = false;
      await prefs.setBool("darkTheme", false);
    } else {
      _selectedTheme = dark;
      _currentTheme = true;
      isDarkTheme = true;
      await prefs.setBool("darkTheme", true);
    }

    notifyListeners();
  }

  ThemeData getTheme() => _selectedTheme;
}
