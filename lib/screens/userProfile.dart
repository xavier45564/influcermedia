import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:influencermedia/app/constraints.dart';
import 'package:influencermedia/app/global.dart';
import 'package:influencermedia/app/widgets.dart';
import 'package:influencermedia/providers/themeChangerProvider.dart';
import 'package:provider/provider.dart';

var thisContext;

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Username",
          style: TextStyle(
              fontFamily: "Leelaw",
              fontWeight: FontWeight.w600,
              color: isDarkTheme ? Colors.white : Color(0xFF27272A)),
        ),
        elevation: 0,
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                _showSettings(context);
              },
              icon: Icon(
                Icons.align_horizontal_right_rounded,
                color: isDarkTheme ? Colors.white : Color(0xFF27272A),
              ))
        ],
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
    double kwidth = MediaQuery.of(context).size.width;
    thisContext = context;
    return SafeArea(
      child: Column(
        children: [
          // Top
          Container(
            padding: EdgeInsets.only(right: 10, left: 10, top: 10),
            child: Row(
              children: [
                Expanded(
                  flex: 8,
                  child: Container(
                    padding: EdgeInsets.only(bottom: 20),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.asset('assets/images/User/2.jpg')),
                  ),
                ),
                SizedBox(width: 5),
                Column(
                  children: [
                    Container(
                      child: Wrap(
                        spacing: kwidth / 9,
                        direction: Axis.horizontal,
                        children: [
                          FollowCount("1.2m", "Tiktok"),
                          FollowCount("1.2m", "Tiktok"),
                          FollowCount("1.2m", "Tiktok"),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    // BUTTONS
                    Container(
                      width: kwidth / 1.5,
                      // color: Color(0xff27272A),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            height: 30,
                            child: ElevatedButton(
                                onPressed: () {},
                                child: Text("Promote",
                                    style: GoogleFonts.mavenPro(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 18))),
                          ),
                          SizedBox(
                            height: 30,
                            child: ElevatedButton(
                                onPressed: () {},
                                child: Text("Collab",
                                    style: GoogleFonts.mavenPro(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 18))),
                          ),
                          SizedBox(
                            height: 30,
                            child: ElevatedButton(
                                onPressed: () {},
                                child: Text("More",
                                    style: GoogleFonts.mavenPro(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 18))),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // MAKE THIS A GRID VIEW
          Expanded(
              child: SingleChildScrollView(
            child: Container(
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Wrap(
                        children: [
                          Image.asset(
                            'assets/images/User/2.jpg',
                            width: kwidth / 3,
                          ),
                          Image.asset(
                            'assets/images/User/2.jpg',
                            width: kwidth / 3,
                          ),
                          Image.asset(
                            'assets/images/User/2.jpg',
                            width: kwidth / 3,
                          ),
                        ],
                      ),
                    ],
                  ),
                                        Wrap(
                        children: [
                          Image.asset(
                            'assets/images/User/2.jpg',
                            width: kwidth / 3,
                          ),
                          Image.asset(
                            'assets/images/User/2.jpg',
                            width: kwidth / 3,
                          ),
                          Image.asset(
                            'assets/images/User/2.jpg',
                            width: kwidth / 3,
                          ),
                        ],
                      ),
                      Wrap(
                        children: [
                          Image.asset(
                            'assets/images/User/2.jpg',
                            width: kwidth / 3,
                          ),
                          Image.asset(
                            'assets/images/User/2.jpg',
                            width: kwidth / 3,
                          ),
                          Image.asset(
                            'assets/images/User/2.jpg',
                            width: kwidth / 3,
                          ),
                        ],
                      ),
                      Wrap(
                        children: [
                          Image.asset(
                            'assets/images/User/2.jpg',
                            width: kwidth / 3,
                          ),
                          Image.asset(
                            'assets/images/User/2.jpg',
                            width: kwidth / 3,
                          ),
                          Image.asset(
                            'assets/images/User/2.jpg',
                            width: kwidth / 3,
                          ),
                        ],
                      ),
                      Wrap(
                        children: [
                          Image.asset(
                            'assets/images/User/2.jpg',
                            width: kwidth / 3,
                          ),
                          Image.asset(
                            'assets/images/User/2.jpg',
                            width: kwidth / 3,
                          ),
                          Image.asset(
                            'assets/images/User/2.jpg',
                            width: kwidth / 3,
                          ),
                        ],
                      ),
                      Wrap(
                        children: [
                          Image.asset(
                            'assets/images/User/2.jpg',
                            width: kwidth / 3,
                          ),
                          Image.asset(
                            'assets/images/User/2.jpg',
                            width: kwidth / 3,
                          ),
                          Image.asset(
                            'assets/images/User/2.jpg',
                            width: kwidth / 3,
                          ),
                        ],
                      ),

                ],
              ),
            ),
          ))
        ],
      ),
    );
  }
}

// start shows the settings
void _showSettings(contextVar) {
  showModalBottomSheet(
      context: contextVar,
      builder: (context) {
        return Container(
          child: Container(
              decoration: BoxDecoration(
                  color: Color(0xFFFCFCFC),
                  borderRadius: BorderRadius.only(
                      topLeft: const Radius.circular(15),
                      topRight: const Radius.circular(15))),
              child: _buildSettings(context)),
        );
      });
}

Container _buildSettings(BuildContext context) {
  double kheight = MediaQuery.of(context).size.height;
  return Container(
      color: isDarkTheme ? Color(0xFF303030) : Colors.white,
      height: kheight,
      padding: EdgeInsets.only(top: 30, left: 15, right: 15),
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(bottom: 20),
                    height: 110,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.asset('assets/images/User/2.jpg')),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "thisisasample@gmail.com",
                    style: TextStyle(
                        color: isDarkTheme ? Colors.white : Color(0xff27272A)),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Image.asset(
                        "assets/images/Icons/dark-mode.png",
                        height: 40,
                      ),
                      SizedBox(width: 10),
                      Text("Dark Mode"),
                      Spacer(),
                      Switch(
                          value: context.read<ThemeProvider>().currentTheme,
                          onChanged: (_currentTheme) {
                            Provider.of<ThemeProvider>(context, listen: false)
                                .swapTheme();
                          }),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [Text("Profile")],
                  ),
                  Row(
                    children: [
                      Image.asset(
                        "assets/images/Icons/user.png",
                        height: 40,
                      ),
                      SizedBox(width: 10),
                      Text("Dark Mode"),
                      Spacer(),
                      Switch(
                          value: context.read<ThemeProvider>().currentTheme,
                          onChanged: (_currentTheme) {
                            Provider.of<ThemeProvider>(context, listen: false)
                                .swapTheme();
                          }),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ));

  // end show the settings
}
