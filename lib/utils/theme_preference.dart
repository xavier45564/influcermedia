import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

var currentTheme;

_saveTheme(savedTheme) async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  // this is the current theme
  currentTheme = (prefs.getBool("currentTheme"));

  // this will set the theme
  await prefs.setBool("currentTheme", savedTheme);
}