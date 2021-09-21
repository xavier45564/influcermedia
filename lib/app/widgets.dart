import 'package:flutter/cupertino.dart';
import 'package:influencermedia/app/constraints.dart';
import 'package:influencermedia/app/global.dart';
import 'package:influencermedia/providers/changePlatformProvider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:influencermedia/providers/themeChangerProvider.dart';
import 'package:influencermedia/screens/user/onBoarding.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../main.dart';

class Promote extends StatefulWidget {
  const Promote({Key? key}) : super(key: key);

  @override
  _PromoteState createState() => _PromoteState();
}

class _PromoteState extends State<Promote> {
  @override
  Widget build(BuildContext context) {
    double kwidth = MediaQuery.of(context).size.width;
    double kheight = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () {},
      child: Column(
        children: [
          Container(
            height: kheight / 15,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.asset('assets/images/User/2.jpg')),
          ),
          Text("Filler")
        ],
      ),
    );
  }
}

class MostFamousAvatar extends StatefulWidget {
  const MostFamousAvatar({Key? key}) : super(key: key);

  @override
  _MostFamousAvatarState createState() => _MostFamousAvatarState();
}

class _MostFamousAvatarState extends State<MostFamousAvatar> {
  @override
  Widget build(BuildContext context) {
    double kwidth = MediaQuery.of(context).size.width;
    double kheight = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: () {},
      child: Container(
        height: kheight / 14,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.asset('assets/images/User/3.jpg')),
      ),
    );
  }
}

class Avatar extends StatefulWidget {
  final String? _avatar;
  const Avatar(this._avatar);

  @override
  _AvatarState createState() => _AvatarState();
}

class _AvatarState extends State<Avatar> {
  @override
  Widget build(BuildContext context) {
    double kwidth = MediaQuery.of(context).size.width;
    double kheight = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: () {},
      child: Container(
        height: kheight / 17,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.asset("${widget._avatar}")),
      ),
    );
  }
}

class TopInfluencer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double kwidth = MediaQuery.of(context).size.width;
    double kheight = MediaQuery.of(context).size.height;

    return Container(
      width: kwidth - 11,
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Row(
          children: [
            MostFamousAvatar(),
            SizedBox(
              width: 20,
            ),
            Stack(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Jack",
                              style: GoogleFonts.mavenPro(
                                  fontSize: 18, fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Image.asset(
                                "assets/images/User/technical-support.png",
                                height: 20)
                          ],
                        ),
                        Text("Technology",
                            style: GoogleFonts.encodeSans(
                                fontSize: 15,
                                color: Color(0xFF768991),
                                fontWeight: FontWeight.w400)),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Spacer(),
            SizedBox(
              width: 87,
              height: 30,
              child: ElevatedButton(
                  onPressed: () {},
                  child: Text("Follow",
                      style: GoogleFonts.mavenPro(
                          fontSize: 15, fontWeight: FontWeight.w500)),
                  style: ButtonStyle(
                      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                          EdgeInsets.symmetric(horizontal: 20, vertical: 0)),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Color(0xFF00A3FF)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30))))),
            ),
          ],
        ),
      ),
    );
  }
}

class CollaborationOpp extends StatefulWidget {
  const CollaborationOpp({Key? key}) : super(key: key);

  @override
  _CollaborationOppState createState() => _CollaborationOppState();
}

class _CollaborationOppState extends State<CollaborationOpp> {
  @override
  Widget build(BuildContext context) {
    double kwidth = MediaQuery.of(context).size.width;
    double kheight = MediaQuery.of(context).size.height;
    
    return Consumer<ThemeProvider>(
      builder: (context, value, child) {
        return Container(
          width: 300,
          height: 230,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: !context.read<ThemeProvider>().currentTheme ? Colors.white : Color(0xFF4c4c4c),
            boxShadow: [
              BoxShadow(
                color: !context.read<ThemeProvider>().currentTheme
                    ? Colors.grey.withOpacity(.25)
                    : Color(0xFF000000).withOpacity(.25),
                spreadRadius: 2,
                blurRadius: 9,
                offset: Offset(-3, 4),
              )
            ],
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 4, top: 5),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10, left: 10),
                      child: Text(
                        "Playing Fortnite With Friends",
                        style: GoogleFonts.mavenPro(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Wrap(
                      spacing: 8,
                      children: [
                        Topics("Travel"),
                        Topics("Gaming"),
                        Topics("Gaming"),
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 13, right: 10, bottom: 10),
                child: Container(
                    width: 300,
                    child: Text(
                      "This video will consist of me and my friends fucking around",
                      style: GoogleFonts.encodeSansSemiCondensed(fontSize: 17),
                    )),
              ),
              Row(
                children: [
                  SizedBox(width: 8),
                  SizedBox(
                      height: kheight / 13,
                      child: Avatar("assets/images/User/1.jpg")),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Stack(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 5),
                                  child: Text(
                                    "Daniel Cope",
                                    style: GoogleFonts.ptSans(
                                        fontWeight: FontWeight.w800, fontSize: 17),
                                  ),
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.location_on_rounded,
                                      color: Colors.red,
                                      size: 20,
                                    ),
                                    Text(
                                      "Japan",
                                      style: TextStyle(fontSize: 17),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 5),
                                  child: Text(
                                      "See Requirements",
                                      style: TextStyle(color: Color(0xFF2196F3)),
                                    ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                width: 270,
                height: 25,
                child: ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(kAccentColor),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)))),
                    child: Text(
                      "Accept Collaboration Invite",
                      style: GoogleFonts.mavenPro(
                          fontWeight: FontWeight.w400, fontSize: 15),
                    )),
              ),
            ],
          ),
        );
      }
    );
  }
}

Widget Topics(String topic) {
  return SizedBox(
    height: 20,
    child: ElevatedButton(
      onPressed: () {},
      child: Text(
        topic,
        style: TextStyle(fontSize: 13),
      ),
      style: ElevatedButton.styleFrom(
          primary: Color.fromRGBO(102, 200, 255, 1),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
    ),
  );
}

class CreateCollaborationOpp extends StatefulWidget {
  const CreateCollaborationOpp({Key? key}) : super(key: key);

  @override
  _CreateCollaborationOppState createState() => _CreateCollaborationOppState();
}

class _CreateCollaborationOppState extends State<CreateCollaborationOpp> {
  @override
  Widget build(BuildContext context) {
    double kwidth = MediaQuery.of(context).size.width;
    double kheight = MediaQuery.of(context).size.height;
    return Container(
      width: 150,
      height: 230,
      padding: EdgeInsets.only(bottom: 15),
      child: Center(
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {},
                child: Image.asset(
                  "assets/images/Buttons/button.png",
                  fit: BoxFit.cover,
                  width: 100,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Create Collab",
              style: GoogleFonts.mavenPro(
                  fontSize: 20, fontWeight: FontWeight.w800),
            )
          ],
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: !context.read<ThemeProvider>().currentTheme ? Colors.white : Color(0xFF4c4c4c),
        boxShadow: [
          BoxShadow(
            color: !context.read<ThemeProvider>().currentTheme
                ? Colors.grey.withOpacity(.25)
                : Color(0xFF000000).withOpacity(.25),
            spreadRadius: 2,
            blurRadius: 9,
            offset: Offset(-3, 4),
          )
        ],
      ),
    );
  }
}

class SignUpButton extends StatelessWidget {
  String? socialIcon;
  String? platform;
  SignUpButton(this.socialIcon, this.platform);

  @override
  Widget build(BuildContext context) {
    double kwidth = MediaQuery.of(context).size.width;

    return Container(
      height: 45,
      width: kwidth / 1.1,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      decoration: BoxDecoration(
          color: !context.read<ThemeProvider>().currentTheme ? Color(0xFFF2F2F2) : Color(0xFF4c4c4c), borderRadius: BorderRadius.circular(25)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/Login Options/$socialIcon',
            scale: 16,
          ),
          SizedBox(
            width: 30,
          ),
          Text(
            "Sign Up With $platform",
            style: GoogleFonts.epilogue(
                fontWeight: FontWeight.w500,
                fontSize: 18,
                ),
          )
        ],
      ),
    );
  }
}

class PlatformButton extends StatelessWidget {
  String? platformIcon;
  String? platformName;
  PlatformButton(this.platformIcon, this.platformName);

  @override
  Widget build(BuildContext context) {
    double kwidth = MediaQuery.of(context).size.width;
    
    return Container(
      key: GlobalKey(),
      height: 45,
      width: kwidth / 1.1,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      decoration: BoxDecoration(
          color: !context.read<ThemeProvider>().currentTheme ? Color(0xFFF2F2F2) : Color(0xFF4c4c4c), borderRadius: BorderRadius.circular(25)),
      child: Row(
        key: GlobalKey(),
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/Social Icons/$platformIcon',
            scale: 16,
          ),
          SizedBox(
            width: 30,
          ),
          Text(
            "Connect With $platformName",
            style: GoogleFonts.epilogue(
                fontWeight: FontWeight.w500,
                fontSize: 18,
                ),
          )
        ],
      ),
    );
  }
}

// SEARCH SCREEN
SearchUser() {
  return Container(
    child: Row(
      children: [
        Container(
          height: 50,
          child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.asset('assets/images/User/2.jpg')),
        ),
        SizedBox(width: 10),
        Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Jack Gay",
                style: GoogleFonts.mavenPro(
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
              ),
              Text(
                "1.2m Followers",
                style: GoogleFonts.roboto(
                  color: Color(0xffBDBDBD),
                  fontSize: 15,
                ),
              )
            ]),
        Spacer(),
        SizedBox(
          width: 115,
          height: 38,
          child: ElevatedButton(
              onPressed: () {},
              child: Text("Follow",
                  style: GoogleFonts.mavenPro(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                  )),
              style: ButtonStyle(
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                      EdgeInsets.symmetric(horizontal: 20, vertical: 0)),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Color(0xFF00A3FF)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12))))),
        ),
      ],
    ),
  );
}

// User Profile
Widget FollowCount(number, plat) {
  return RichText(
    textAlign: TextAlign.center,
    text: TextSpan(
      children: [
        TextSpan(
            text: "$number\n",
            style: GoogleFonts.mavenPro(
                fontWeight: FontWeight.w500,
                fontSize: 24,
                color: isDarkTheme ? Colors.white : Color(0xff27272A),
             )),
        TextSpan(
            text: "$plat",
            style: GoogleFonts.mavenPro(
                fontWeight: FontWeight.w500,
                fontSize: 15,
                color: Color(0xFF9E9E9E))),
      ],
    ),
  );
}
