import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:influencermedia/providers/themeChangerProvider.dart';
import 'package:influencermedia/screens/home.dart';
import 'package:influencermedia/providers/greetingProvider.dart';
import 'package:influencermedia/providers/changePlatformProvider.dart';
import 'package:influencermedia/screens/theme.dart';
import 'package:influencermedia/screens/user/onBoarding.dart';
import 'package:influencermedia/app/constraints.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app/global.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseAppCheck.instance
      .activate(webRecaptchaSiteKey: 'recaptcha-v3-site-key');
  SharedPreferences.getInstance().then((prefs) {
    isDarkTheme = prefs.getBool("darkTheme") ?? false;
    runApp(MultiProvider(child: MyApp(), providers: [
      ChangeNotifierProvider(create: (_) => GreetingProvider()),
      ChangeNotifierProvider(create: (_) => PlatFormProvider()),
      // ChangeNotifierProvider(create: (_) => ThemeChangerProvider()),
      ChangeNotifierProvider<ThemeProvider>(
        child: MyApp(),
        create: (BuildContext context) {
          return ThemeProvider(isDarkTheme);
        },
      ),
    ]));
  });
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // bool isLightTheme = Provider.of<ThemeChangerProvider>(context).isLightTheme;
    return Consumer<ThemeProvider>(builder: (context, value, child) {
      return MaterialApp(home: Home(), theme: value.getTheme());
    });
  }
}
