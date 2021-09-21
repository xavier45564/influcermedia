import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:influencermedia/app/global.dart';
import 'package:influencermedia/screens/user/signup.dart';
import 'package:influencermedia/screens/user/verify.dart';
import 'package:line_icons/line_icon.dart';
import 'package:provider/provider.dart';
import 'package:influencermedia/app/constraints.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:influencermedia/app/widgets.dart';
import 'package:influencermedia/providers/greetingProvider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:flutter/material.dart';
import '../main.dart';
import 'notifications.dart';
import 'userProfile.dart';
import 'createPost.dart';
import 'search.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // User? user;
  bool isSigned = false;
  bool isVerified = false;

  // void isSignedd() {
  //   if (FirebaseAuth.instance.currentUser == null) {
  //     isSigned = false;
  //   } else {
  //     isSigned = true;
  //   }
  // }

  int _currentIndex = 0;
  final List<Widget> screens = [
    Body(),
    Search(),
    CreatePost(),
    Notifications(),
    UserProfile(),
  ];
  void onTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      // backgroundColor: kBackground,
      body: screens[_currentIndex],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 20, left: 10, right: 10),
        child: Container(
          decoration: BoxDecoration(
              // color: kAccentColor,
              borderRadius: BorderRadius.circular(20)),
          child: ClipRect(
            child: GNav(
              backgroundColor: Colors.transparent,
              rippleColor: Colors.grey,
              hoverColor: Colors.grey,
              tabBorderRadius: 10,
              gap: 5,
              curve: Curves.easeOutExpo,
              duration: Duration(milliseconds: 900),
              color: Colors.grey[800],
              activeColor: kAccentColor,
              iconSize: 23,
              haptic: true,
              tabBackgroundColor: kAccentColor.withOpacity(0.2),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              tabs: [
                GButton(
                  icon: LineIcons.home,
                  iconColor: isDarkTheme ? Colors.grey : Colors.blueGrey,
                  iconActiveColor: isDarkTheme ? Colors.grey : Colors.blueGrey,
                  textColor: isDarkTheme ? Colors.grey : Colors.blueGrey,
                  text: "Home",
                  backgroundGradient: LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                    colors: [
                      Colors.blue.withOpacity(.3),
                      Colors.white.withOpacity(.3),
                    ],
                  ),
                ),
                GButton(
                  iconColor: isDarkTheme ? Colors.grey : Colors.blueGrey,
                  iconActiveColor: isDarkTheme ? Colors.grey : Colors.blueGrey,
                  textColor: isDarkTheme ? Colors.grey : Colors.blueGrey,
                  icon: LineIcons.search,
                  text: "Search",
                ),
                GButton(
                  iconColor: isDarkTheme ? Colors.grey : Colors.blueGrey,
                  iconActiveColor: isDarkTheme ? Colors.grey : Colors.blueGrey,
                  textColor: isDarkTheme ? Colors.grey : Colors.blueGrey,
                  icon: LineIcons.plus,
                  text: "Post",
                ),
                GButton(
                  iconColor: isDarkTheme ? Colors.grey : Colors.blueGrey,
                  iconActiveColor: isDarkTheme ? Colors.grey : Colors.blueGrey,
                  textColor: isDarkTheme ? Colors.grey : Colors.blueGrey,
                  icon: LineIcons.bell,
                  text: "Alerts",
                ),
                GButton(
                  iconColor: isDarkTheme ? Colors.grey : Colors.blueGrey,
                  iconActiveColor: isDarkTheme ? Colors.grey : Colors.blueGrey,
                  textColor: isDarkTheme ? Colors.grey : Colors.blueGrey,
                  icon: LineIcons.user,
                  text: "Profile",
                  backgroundGradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      Colors.blue.withOpacity(.3),
                      Colors.white.withOpacity(.3),
                    ],
                  ),
                ),
              ],
              selectedIndex: _currentIndex,
              onTabChange: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
          ),
        ),
      ),
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
  void initState() {
    super.initState();
  }

  @override
  void dipose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double kwidth = MediaQuery.of(context).size.width;
    double kheight = MediaQuery.of(context).size.height;
    final ggreeting = Provider.of<GreetingProvider>(context).greeting;

    return Scaffold(
      appBar: AppBar(
        title: Text("Good $ggreeting", style: TextStyle(fontFamily: "Leelaw", fontWeight: FontWeight.w600, color: isDarkTheme ? Colors.white30 : Color(0xFF27272A))),
        elevation: 0,
        // backgroundColor: kBackground,
        actions: [
          Padding(
              padding: const EdgeInsets.only(right: 10),
              child:
                  // Image.asset(
                  //   'assets/images/Buttons/chat.png',
                  //   width: kwidth / 17,
                  // ),
                  IconButton(
                      onPressed: () {}, icon: Icon(Icons.message_rounded, color: isDarkTheme ? Colors.white30 : Color(0xFF27272A),)))
        ],
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Promote(),
                        Promote(),
                        Promote(),
                        Promote(),
                        Promote(),
                        Promote(),
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: kwidth / 1.05,
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                top: 10,
                                left: 10,
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "Most Famous",
                                    style: TextStyle(
                                        fontFamily: "Leelaw",
                                        fontWeight: FontWeight.w600,
                                        fontSize: 20),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Wrap(
                              runSpacing: 3,
                              children: [
                                TopInfluencer(),
                                Divider(
                                  thickness: 1.5,
                                  indent: 10,
                                  endIndent: 10,
                                ),
                                TopInfluencer(),
                                Divider(
                                  thickness: 1.5,
                                  indent: 10,
                                  endIndent: 10,
                                ),
                                TopInfluencer(),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 20,
                      left: 17,
                    ),
                    child: Row(
                      children: [
                        Text(
                                    "Collaboration Opportunities",
                                    style: TextStyle(
                                        fontFamily: "Leelaw",
                                        fontWeight: FontWeight.w600,
                                        fontSize: 20),
                                  )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 250,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: <Widget>[
                                Wrap(
                                  spacing: 20,
                                  children: [
                                    SizedBox(),
                                    CreateCollaborationOpp(),
                                    CollaborationOpp(),
                                    CollaborationOpp(),
                                    CollaborationOpp(),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              )
            ],
          ),
        ),
      ),
    );
  }
}
