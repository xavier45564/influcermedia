import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

bool _isLightMode = true;

TextStyle kPrimaryFont(
  double size,
) {
  return GoogleFonts.ubuntu(fontSize: size);
}

Color kBackground = _isLightMode ? Colors.white : Color(0xff27272A);
Color kAccentColor = Color(0xFF4C9AFE);
Color kPrimaryColor = _isLightMode ? Color(0xFF272A35) : Colors.white;
Color kSecondaryColor = Colors.white;