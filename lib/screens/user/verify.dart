// import 'package:firebase_auth/firebase_auth.dart';
// import 'signin.dart';
// import 'signup.dart';
// import 'package:flutter/material.dart';
// import 'dart:async';
// import 'package:influencermedia/screens/home.dart';

// class VerifyScreen extends StatefulWidget {
//   const VerifyScreen({Key? key}) : super(key: key);

//   @override
//   _VerifyScreenState createState() => _VerifyScreenState();
// }

// class _VerifyScreenState extends State<VerifyScreen> {
//   final auth = FirebaseAuth.instance;
//   User? user;
//   Timer? timer;

//   @override
//   void initState() {
//     user = auth.currentUser;
//     user?.sendEmailVerification();
 
//     timer = Timer.periodic(Duration(seconds: 1), (timer) {
//       user = auth.currentUser;
//       checkEmailVerified();
//     });
//     super.initState();
//   }

//   @override
//   void dispose() {
//     timer?.cancel();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Firebase"),
//         automaticallyImplyLeading: false,
//         actions: [IconButton(onPressed: (){Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignIn()));}, icon: Icon(Icons.loupe_outlined))],
//       ),
//       body: Center(
//           child:
//               Column(
//                 children: [
//                   Text("An email has been sent to ${user?.email} please verify."),
//                   TextButton(onPressed: (){
//                     auth.signOut();
//                     Navigator.of(context).push(MaterialPageRoute(builder: (context) => UserInformation()));
//                   }, child: Text("Sign Out and Retry?"))
//                 ],
//               )),
              
//     );
//   }

//   Future<void> checkEmailVerified() async {
//     user = auth.currentUser;
//     await user?.reload();
//     if (user!.emailVerified) {
//       timer?.cancel();
//       Navigator.of(context)
//           .push(MaterialPageRoute(builder: (context) => Home()));
//     }
//   }
// }
