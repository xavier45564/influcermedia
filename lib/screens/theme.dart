import 'package:flutter/material.dart';
import 'package:influencermedia/main.dart';
import 'package:influencermedia/utils/theme_preference.dart';
import 'package:influencermedia/providers/themeChangerProvider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemePage extends StatelessWidget {
  const ThemePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Theme"),
      ),
      body: Body(),
    );
  }
}

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    double kheight = MediaQuery.of(context).size.height;
    double kwidth = MediaQuery.of(context).size.width;
    // final bool !isDarkTheme = Provider.of<ThemeChangerProvider>(context).!isDarkTheme;

    return Container(
      height: kheight,
      width: kwidth,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(onPressed: () {}, child: Text("Sample Button")),
          Text(context.read<ThemeProvider>().currentTheme ? "Dark Mode" : "Light Mode"),
          Switch(
              value: context.read<ThemeProvider>().currentTheme,
              onChanged: (_currentTheme) {
                Provider.of<ThemeProvider>(context, listen: false).swapTheme();
              }),
        ],
      ),
    );
  }

  _saveTheme(savedTheme) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // this is the current theme
    var currentTheme = (prefs.getBool("currentTheme"));

    // this will set the theme
    await prefs.setBool("currentTheme", savedTheme);
    print(currentTheme);
  }
}