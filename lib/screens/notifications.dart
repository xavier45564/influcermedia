import 'package:flutter/material.dart';
import 'package:influencermedia/app/constraints.dart';

class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text("Notifications"),),
    );
  }
}