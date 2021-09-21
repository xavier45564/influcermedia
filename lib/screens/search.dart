import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:influencermedia/app/global.dart';
import 'package:influencermedia/app/widgets.dart';
import 'package:influencermedia/main.dart';
import 'package:influencermedia/providers/themeChangerProvider.dart';
import 'package:provider/provider.dart';
import 'search.dart';
import 'home.dart';
import 'createPost.dart';
import 'userProfile.dart';
import 'package:influencermedia/app/constraints.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          title: Text(
            "Search",
            style: TextStyle(fontFamily: "Leelaw", fontWeight: FontWeight.w600, color: isDarkTheme ? Colors.white30 : Color(0xFF27272A)),
          ),
          centerTitle: true,
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
  TextEditingController? _userSearch;
  @override
  Widget build(BuildContext context) {
    double kwidth = MediaQuery.of(context).size.width;
    double kheight = MediaQuery.of(context).size.height;
    // bool isLightTheme = Provider.of<ThemeChangerProvider>(context).isLightTheme;
    
    return SafeArea(
      child: Container(
        height: 120,
        padding: EdgeInsets.only(right: 20, left: 20, bottom: 10),
        child: Column(
          children: [
            SizedBox(height: 15),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 45,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: !isDarkTheme ? Colors.grey[200] : Color(0xFF4c4c4c)
                        ),
                    child: TextField(
                      controller: _userSearch,
                      decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.grey,
                          ),
                          border: InputBorder.none,
                          hintStyle:
                              TextStyle(color: Colors.grey, fontSize: 18),
                          hintText: "Search Influencers"),
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Icon(Icons.filter_list_rounded,
                    size: 30),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: Wrap(
                runSpacing: 10,
                children: [
                  SearchUser(),
                  SearchUser(),
                  SearchUser(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
