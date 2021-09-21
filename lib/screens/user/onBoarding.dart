import 'package:flutter/cupertino.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:influencermedia/app/widgets.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:influencermedia/model/user.dart';
import 'package:provider/provider.dart';
import 'package:influencermedia/providers/changePlatformProvider.dart';
import 'package:flutter/material.dart';
import 'package:influencermedia/screens/home.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io' show Platform;

import '../../main.dart';
// this package is causing a error with provider
// import 'package:path/path.dart';

class Landing extends StatefulWidget {
  @override
  _LandingState createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  int _currentPage = 0;
  PageController _controller = PageController();

  List<Widget> _pages = [
    OnBoardingOne(),
    OnBoardingTwo(),
    OnBoardingThree(),
    OnBoardingFour(),
  ];

  _onchanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    double kwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            PageView.builder(
              scrollDirection: Axis.horizontal,
              onPageChanged: _onchanged,
              controller: _controller,
              itemCount: _pages.length,
              itemBuilder: (context, int index) {
                return _pages[index];
              },
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: (_currentPage != 0)
                  ? IconButton(
                      onPressed: () {
                        _controller.previousPage(
                            duration: Duration(milliseconds: 800),
                            curve: Curves.easeInOutQuint);
                      },
                      icon: Icon(
                        Icons.navigate_before,
                        size: 40,
                      ))
                  : null,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:
                            List<Widget>.generate(_pages.length, (int index) {
                          return AnimatedContainer(
                              duration: Duration(milliseconds: 300),
                              height: 10,
                              width: (index == _currentPage) ? 30 : 10,
                              margin: EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 30),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: (index == _currentPage)
                                      ? Colors.blue
                                      : Colors.blue.withOpacity(0.5)));
                        })),
                    Spacer(),
                    InkWell(
                      onTap: () {
                        _controller.nextPage(
                            duration: Duration(milliseconds: 800),
                            curve: Curves.easeInOutQuint);
                      },
                      child: AnimatedContainer(
                        alignment: Alignment.center,
                        duration: Duration(milliseconds: 300),
                        width: 184,
                        height: 39,
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(15)),
                        child: (_currentPage == (_pages.length - 1))
                            ? GestureDetector(
                                onTap: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Home()));
                                },
                                child: Text(
                                  "Get Started",
                                  style: TextStyle(
                                    // color: Colors.white,
                                    fontSize: 20,
                                  ),
                                ),
                              )
                            : Center(
                                child: Text("Continue",
                                    style: GoogleFonts.encodeSans(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 24,
                                      color: Colors.white,
                                    ))),
                      ),
                    ),
                    FractionallySizedBox(
                      heightFactor: 0.13,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OnBoardingOne extends StatefulWidget {
  const OnBoardingOne({Key? key}) : super(key: key);

  @override
  _OnBoardingOneState createState() => _OnBoardingOneState();
}

class _OnBoardingOneState extends State<OnBoardingOne> {
  @override
  Widget build(BuildContext context) {
    double kwidth = MediaQuery.of(context).size.width;
    double kheight = MediaQuery.of(context).size.height;
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/Illustrations/undraw_Through_the_desert_re_1q2x.png",
            width: kwidth,
          ),
          Flexible(
            child: FractionallySizedBox(
              heightFactor: 0.13,
            ),
          ),
          AutoSizeText(
            "Lets Climb Mountains Together",
            style: GoogleFonts.mavenPro(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          Flexible(
            child: FractionallySizedBox(
              heightFactor: 0.03,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: kwidth / 10),
            child: AutoSizeText(
              "Become friends with other influencers to collaborate and grow together!",
              textAlign: TextAlign.center,
              maxFontSize: 20,
              style: GoogleFonts.encodeSansSemiCondensed(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  color: Color(0xFFB3B3B3)),
            ),
          ),
        ],
      ),
    );
  }
}

class OnBoardingTwo extends StatefulWidget {
  const OnBoardingTwo({Key? key}) : super(key: key);

  @override
  _OnBoardingTwoState createState() => _OnBoardingTwoState();
}

class _OnBoardingTwoState extends State<OnBoardingTwo> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double kheight = MediaQuery.of(context).size.height;
    double kwidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Column(
        children: [
          // Top Part
          Container(
            width: kwidth,
            padding: EdgeInsets.only(left: 25, right: 25, top: kheight / 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text("Create Your\nFree Account",
                              style: GoogleFonts.mavenPro(
                                fontWeight: FontWeight.w500,
                                fontSize: 36,
                              )),
                          SizedBox(
                            width: 10,
                          ),
                          SvgPicture.asset(
                            'assets/images/Illustrations/undraw_Sync_files_re_ws4c.svg',
                            width: kwidth / 4,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: kheight / 80,
                    ),
                    Text(
                        "Make new friends and start collabing with\nother influencers to grow platforms together",
                        style: GoogleFonts.encodeSansSemiCondensed(
                            fontWeight: FontWeight.w400,
                            fontSize: 18,
                            color: Color(0xFFB3B3B3))),
                  ],
                ),
              ],
            ),
          ),
          Container(
            height: kheight / 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SignUpButton("google-plus.png", "Google"),
                SignUpButton("facebook.png", "Facebook"),
                SignUpButton("email.png", "Email"),
                SignUpButton("twitter.png", "Twitter"),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Text(
              "Already have an account?",
              style: GoogleFonts.encodeSans(
                fontWeight: FontWeight.w400,
                fontSize: 18,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class OnBoardingThree extends StatefulWidget {
  const OnBoardingThree({Key? key}) : super(key: key);

  @override
  _OnBoardingThreeState createState() => _OnBoardingThreeState();
}

class _OnBoardingThreeState extends State<OnBoardingThree> {
  @override
  Widget build(BuildContext context) {
    double kheight = MediaQuery.of(context).size.height;
    double kwidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Column(
        children: [
          // Top Part
          Container(
            width: kwidth,
            padding: EdgeInsets.only(left: 25, right: 25, top: kheight / 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text("Connect Your\nPlatforms",
                              style: GoogleFonts.mavenPro(
                                fontWeight: FontWeight.w500,
                                fontSize: 36,
                              )),
                          SizedBox(
                            width: 10,
                          ),
                          SvgPicture.asset(
                            'assets/images/Illustrations/undraw_Connecting_Teams_8ntu.svg',
                            width: kwidth / 4,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                        "Connect your most followed platforms that\nyou want to find other influencers with",
                        style: GoogleFonts.encodeSansSemiCondensed(
                            fontWeight: FontWeight.w400,
                            fontSize: 18,
                            color: Color(0xFFB3B3B3))),
                  ],
                ),
              ],
            ),
          ),
          Container(
            height: kheight / 1.9,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                    onTap: _onYoutubeButtonPressed,
                    child: PlatformButton("youtube.png", "Youtube")),
                GestureDetector(
                    onTap: _onTiktokButtonPressed,
                    child: PlatformButton("tiktok.png", "Tiktok")),
                GestureDetector(
                    onTap: _onTwitchButtonPressed,
                    child: PlatformButton("twitch.png", "Twitch")),
                GestureDetector(
                    onTap: _onInstagramButtonPressed,
                    child: PlatformButton("instagram.png", "Instagram")),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _onYoutubeButtonPressed() {
    context.read<PlatFormProvider>().getYoutube();
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            color: Color(0xFF737373),
            child: Container(
                decoration: BoxDecoration(
                    color: Color(0xFFFCFCFC),
                    borderRadius: BorderRadius.only(
                        topLeft: const Radius.circular(15),
                        topRight: const Radius.circular(15))),
                child: _buildColumn(context)),
          );
        });
  }

  void _onTiktokButtonPressed() {
    context.read<PlatFormProvider>().getTiktok();
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            color: Color(0xFF737373),
            child: Container(
                decoration: BoxDecoration(
                    color: Color(0xFFFCFCFC),
                    borderRadius: BorderRadius.only(
                        topLeft: const Radius.circular(15),
                        topRight: const Radius.circular(15))),
                child: _buildColumn(context)),
          );
        });
  }

  void _onTwitchButtonPressed() {
    context.read<PlatFormProvider>().getTwitch();
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            color: Color(0xFF737373),
            child: Container(
                decoration: BoxDecoration(
                    color: Color(0xFFFCFCFC),
                    borderRadius: BorderRadius.only(
                        topLeft: const Radius.circular(15),
                        topRight: const Radius.circular(15))),
                child: _buildColumn(context)),
          );
        });
  }

  void _onInstagramButtonPressed() {
    context.read<PlatFormProvider>().getInstagram();
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            color: Color(0xFF737373),
            child: Container(
                decoration: BoxDecoration(
                    color: Color(0xFFFCFCFC),
                    borderRadius: BorderRadius.only(
                        topLeft: const Radius.circular(15),
                        topRight: const Radius.circular(15))),
                child: _buildColumn(context)),
          );
        });
  }

  Container _buildColumn(BuildContext context) {
    double kwidth = MediaQuery.of(context).size.width;
    double kheight = MediaQuery.of(context).size.height;
    List platformText = context.watch<PlatFormProvider>().onBoardingText;
    TextEditingController? userPlatform;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Spacer(
                flex: 2,
              ),
              Container(
                  decoration: BoxDecoration(
                      color: Color(0xFFC4C4C4),
                      borderRadius: BorderRadius.circular(30)),
                  height: kheight / 70,
                  width: kwidth / 3),
              Spacer(),
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.close_rounded))
            ],
          ),
          Center(
              child: SvgPicture.asset(
                  'assets/images/Illustrations/undraw_join_of2w.svg',
                  width: kwidth / 2)),
          Flexible(
              child: FractionallySizedBox(
            heightFactor: .4,
          )),
          Row(
            children: [
              Text(
                "${platformText[0]}",
                style: GoogleFonts.mavenPro(
                    fontWeight: FontWeight.w400, fontSize: 24),
              ),
            ],
          ),
          TextField(
              controller: userPlatform,
              style: TextStyle(
                fontSize: 18,
              ),
              decoration: InputDecoration(
                  hintText: "${platformText[1]}",
                  border: InputBorder.none,
                  filled: true,
                  fillColor: Color(0xFFEBEAEA),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(15),
                  ))),
          Flexible(
              child: FractionallySizedBox(
            heightFactor: .8,
          )),
          Row(
            children: [
              Container(
                width: kwidth / 1.1,
                child: AutoSizeText(
                  "${platformText[2]}",
                  style: GoogleFonts.mavenPro(fontWeight: FontWeight.w400),
                  maxLines: 2,
                  minFontSize: 24,
                  overflow: TextOverflow.visible,
                ),
              ),
            ],
          ),
          Spacer(),
          ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Color(0xFF1E4FFB)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  minimumSize: MaterialStateProperty.all<Size>(
                      Size(double.infinity - 10, 35))),
              child: Text(
                "Finish Platform Setup",
                style: GoogleFonts.encodeSans(fontSize: 20),
              ))
        ],
      ),
    );
  }
}

class OnBoardingFour extends StatefulWidget {
  const OnBoardingFour({Key? key}) : super(key: key);

  @override
  _OnBoardingFourState createState() => _OnBoardingFourState();
}

class _OnBoardingFourState extends State<OnBoardingFour> {
  @override
  Widget build(BuildContext context) {
    double kwidth = MediaQuery.of(context).size.width;
    double kheight = MediaQuery.of(context).size.height;
    return Container(
      height: kheight,
      width: kwidth,
      child: Column(
        children: [
          Flexible(
              child: FractionallySizedBox(
            heightFactor: .5,
          )),
          ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.asset(
                "assets/images/User/2.jpg",
                width: kwidth / 2.5,
                height: kwidth / 2.5,
              )),
          TextButton(
            child: Text("Change Profile Pic",
                style: GoogleFonts.mavenPro(
                    fontWeight: FontWeight.w400, fontSize: 20)),
            onPressed: () {},
          ),
          Flexible(
              child: FractionallySizedBox(
            heightFactor: .03,
          )),
          Form(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              height: kheight / 2.2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextFormField(
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.person),
                          hintText: "Name",
                          contentPadding: EdgeInsets.symmetric(horizontal: 10),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)))),
                  TextFormField(
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.alternate_email_outlined),
                          hintText: "Username",
                          contentPadding: EdgeInsets.symmetric(horizontal: 10),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)))),
                  TextFormField(
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.location_on),
                          hintText: "Location",
                          contentPadding: EdgeInsets.symmetric(horizontal: 10),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)))),
                  TextFormField(
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.create),
                          hintText: "Content Type",
                          contentPadding: EdgeInsets.symmetric(horizontal: 10),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)))),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

