// import 'dart:async';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'signup.dart';
// import 'package:influencermedia/screens/home.dart';

// FirebaseAuth auth = FirebaseAuth.instance;

// class SignIn extends StatelessWidget {
//   const SignIn({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text("Firebase"),
//         ),
//         body: Body(),
//       ),
//     );
//   }
// }

// class Body extends StatelessWidget {
//   const Body({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Firebase"),
//       ),
//       body: Body(),
//     );
//   }
// }

// class Body1 extends StatefulWidget {
//   const Body1({Key? key}) : super(key: key);

//   @override
//   _BodyState1 createState() => _BodyState1();
// }

// class _BodyState1 extends State<Body1> {
//   final _formKey = GlobalKey<FormState>();
//   String? _loginPassword;
//   String? _loginEmail;

//   CollectionReference _collectionRef =
//       FirebaseFirestore.instance.collection('userEmails');

//   bool isTaken = false;

//   Future<void> getData(emailValue) async {
//     QuerySnapshot querySnapshot = await _collectionRef.get();
//     final allData = querySnapshot.docs.map((doc) => doc.data()).toList();
//     List newData = [].toList();
//     allData.forEach((value1) {
//       newData.add(value1
//           .toString()
//           .replaceAll("email: ", "")
//           .replaceAll("{", "")
//           .replaceAll("}", ''));
//     });

//     newData.forEach((element) {
//       if (emailValue == element) {
//         isTaken = true;
//       }
//     });
//   }

//   bool isVerifed = false;

//   final auth = FirebaseAuth.instance;
//   User? user;

//   Future<void> CheckEmailVerified() async {
//     user = auth.currentUser;
//     await user?.reload();
//     if (user!.emailVerified) {
//       isVerifed = true;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Form(
//         key: _formKey,
//         child: Padding(
//           padding: const EdgeInsets.only(top: 30, left: 10, right: 10),
//           child: Column(
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text("Sign In"),
//                 ],
//               ),
//               TextFormField(
//                 keyboardType: TextInputType.emailAddress,
//                 validator: (emaill) {
//                   if (emaill!.length == 0) {
//                     return "*Required";
//                   } else if (!isTaken) {
//                     return "Email Doesn't Exist";
//                   } else {
//                     return null;
//                   }
//                 },
//                 onChanged: (loginEmail) {
//                   _loginEmail = loginEmail;
//                   getData(_loginEmail);
//                   print(_loginEmail);
//                 },
//                 decoration: InputDecoration(hintText: "Email"),
//               ),
//               TextFormField(
//                 obscureText: true,
//                 validator: (pass) {
//                   if (pass!.length == 0) {
//                     return "*Required";
//                   } else {
//                     return null;
//                   }
//                 },
//                 onChanged: (password) {
//                   setState(() {
//                     _loginPassword = password;
//                   });
//                   print(_loginPassword);
//                 },
//                 decoration: InputDecoration(hintText: "Password"),
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 mainAxisSize: MainAxisSize.max,
//                 children: [
//                   TextButton(
//                     onPressed: () {
//                       print("Filler");
//                     },
//                     child: Text("Forgot Password?"),
//                   ),
//                   TextButton(
//                     onPressed: () {
//                       Navigator.of(context).push(MaterialPageRoute(
//                           builder: (context) => UserInformation()));
//                     },
//                     child: Text("Register!"),
//                   ),
//                 ],
//               ),
//               TextButton(
//                   onPressed: () {
//                     final isValid = _formKey.currentState!.validate();
//                     if (isValid) {
//                       try {
//                         auth
//                             .signInWithEmailAndPassword(
//                                 email: _loginEmail.toString(),
//                                 password: _loginPassword.toString())
//                             .then((value) => {
//                                   Navigator.of(context).push(MaterialPageRoute(
//                                       builder: (context) => Home()))
//                                 });
//                       } on FirebaseAuthException catch (e) {
//                         if (e.code == "user-not-found") {
//                           print("No user found for that email");
//                         } else if (e.code == "wrong-password") {
//                           print("Wrong password provided for that user");
//                         }
//                       }
//                     }
//                   },
//                   child: Text("Sign In")),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
