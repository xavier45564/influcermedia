// import 'dart:async';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'reset.dart';
// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'signin.dart';
// import 'package:influencermedia/screens/home.dart';
// import 'verify.dart';
// import 'social_auth.dart';

// class UserInformation extends StatelessWidget {
//   const UserInformation({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaf(),
//     );
//   }
// }

// class Scaf extends StatelessWidget {
//   const Scaf({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Firebase"),
//         actions: [
//           IconButton(
//               onPressed: () {
//                 Navigator.push(
//                     context, MaterialPageRoute(builder: (context) => Home()));
//               },
//               icon: Icon(Icons.looks))
//         ],
//       ),
//       body: Body(),
//     );
//   }
// }
// // Future<UserCredential> signInWithGoogle() async {
// //   // Trigger the authentication flow
// //   final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();

// //   // Obtain the auth details from the request
// //   final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

// //   // Create a new credential
// //   final credential = GoogleAuthProvider.credential(
// //     accessToken: googleAuth.accessToken,
// //     idToken: googleAuth.idToken,
// //   );

// //   // Once signed in, return the UserCredential
// //   return await FirebaseAuth.instance.signInWithCredential(credential);
// // }

// class Body extends StatefulWidget {
//   @override
//   _BodyState createState() => _BodyState();
// }

// class _BodyState extends State<Body> {
//   final formKey = GlobalKey<FormState>();
//   CollectionReference userEmail =
//       FirebaseFirestore.instance.collection('userEmails');
//   Stream userEmails =
//       FirebaseFirestore.instance.collection('userEmails').snapshots();
//   String? mLoginEmailField,
//       mLoginPasswordField,
//       mLoginPasswordField2,
//       _passwordError,
//       _emailError;

//   CollectionReference _collectionRef =
//       FirebaseFirestore.instance.collection('userEmails');

//   bool isTaken = false;
//   bool isVerifed = false;

//   final auth = FirebaseAuth.instance;
//   User? user;
//   Timer? timer;

//   Future<void> CheckEmailVerified() async {
//     user = auth.currentUser;
//     await user?.reload();
//     if (user!.emailVerified) {
//       timer?.cancel();
//       isVerifed = true;
//       Navigator.of(context)
//           .push(MaterialPageRoute(builder: (context) => Home()));
//     }
//   }

//   @override
//   void initState() {
//     user = auth.currentUser;
//     if (user != null && isVerifed) {
//       WidgetsBinding.instance?.addPostFrameCallback((_) {
//         Navigator.push(context, MaterialPageRoute(builder: (_) => Home()));
//       });
//     }
//     super.initState();
//   }

//   @override
//   void dispose() {
//     super.dispose();
//   }

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

//   Future<void> addEmail(x) {
//     if (isTaken == false) {
//       return userEmail.add({
//         'email': x,
//       }).catchError((error) => print("Failed to add user: $error"));
//     } else {
//       return FirebaseFirestore.instance
//           .collection('dump')
//           .add({'field': "field"});
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Container(
//         child: Form(
//           key: formKey,
//           child: Column(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.only(top: 30),
//                 child: Text("Sign Up"),
//               ),
//               ElevatedButton.icon(
//                   onPressed: () {signInWithGoogle();},
//                   style: ElevatedButton.styleFrom(
//                       primary: Colors.white,
//                       onPrimary: Colors.black,
//                       minimumSize: Size(double.infinity, 50)),
//                   icon: FaIcon(FontAwesomeIcons.google, color: Colors.red),
//                   label: Text("Sign In with Google")),
//               ElevatedButton.icon(
//                   onPressed: () {signInWithApple();},
//                   style: ElevatedButton.styleFrom(
//                       primary: Colors.white,
//                       onPrimary: Colors.black,
//                       minimumSize: Size(double.infinity, 50)),
//                   icon: FaIcon(FontAwesomeIcons.apple, color: Colors.red),
//                   label: Text("Sign In with Apple")),
//               TextFormField(
//                 keyboardType: TextInputType.emailAddress,
//                 validator: (value) {
//                   if (isTaken == true) {
//                     return "Email Is Taken";
//                   } else if (_emailError != null) {
//                     return _emailError;
//                   } else if (value!.length >= 1) {
//                     return null;
//                   } else {
//                     return "*Required";
//                   }
//                 },
//                 onChanged: (valueThis) {
//                   mLoginEmailField = valueThis.trim();
//                   getData(valueThis);
//                 },
//                 decoration: InputDecoration(
//                   hintText: "Email Address",
//                 ),
//               ),
//               TextFormField(
//                 obscureText: true,
//                 validator: (value) {
//                   if (_passwordError != null) {
//                     return _passwordError;
//                   } else if (value!.length > 6) {
//                     return null;
//                   } else {
//                     return "Password must be 6 or more charectors";
//                   }
//                 },
//                 onChanged: (value) {
//                   mLoginPasswordField = value.toString().trim();
//                 },
//                 decoration: InputDecoration(
//                   hintText: "Password",
//                 ),
//               ),
//               TextFormField(
//                 obscureText: true,
//                 validator: (value) {
//                   if (_passwordError != null) {
//                     return _passwordError;
//                   } else if (value!.length > 6) {
//                     return null;
//                   } else if (mLoginPasswordField != mLoginPasswordField2) {
//                     return "Passwords Don't Match";
//                   } else {
//                     return "Password must be 6 or more charectors";
//                   }
//                 },
//                 onChanged: (value) {
//                   mLoginPasswordField2 = value.toString().trim();
//                 },
//                 decoration: InputDecoration(
//                   hintText: "Confirm Password",
//                 ),
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 mainAxisSize: MainAxisSize.max,
//                 children: [
//                   TextButton(
//                     onPressed: () {
//                       Navigator.of(context).push(MaterialPageRoute(
//                           builder: (context) => ResetScreen()));
//                     },
//                     child: Text("Forgot Password"),
//                   ),
//                   TextButton(
//                     onPressed: () {
//                       Navigator.of(context).push(
//                           MaterialPageRoute(builder: (context) => SignIn()));
//                     },
//                     child: Text("Login!"),
//                   ),
//                 ],
//               ),
//               TextButton(
//                   onPressed: () {
//                     final isValid = formKey.currentState!.validate();
//                     if (isValid) {
//                       try {
//                         FirebaseAuth.instance
//                             .createUserWithEmailAndPassword(
//                                 email: "$mLoginEmailField",
//                                 password: "$mLoginPasswordField")
//                             .then((value) => {
//                                   addEmail(mLoginEmailField),
//                                   Navigator.of(context)
//                                       .pushReplacement(MaterialPageRoute(
//                                     builder: (context) => VerifyScreen(),
//                                   ))
//                                 });
//                       } on FirebaseAuthException catch (e) {
//                         if (e.code == 'weak-password') {
//                           showDialog(
//                               context: context,
//                               builder: (BuildContext context) {
//                                 return AlertDialog(
//                                   content: Text(
//                                       "The password provided is too weak."),
//                                 );
//                               });
//                         } else if (e.code == 'email-already-in-use') {
//                           showDialog(
//                               context: context,
//                               builder: (BuildContext context) {
//                                 return AlertDialog(
//                                   content: Text(
//                                       "An account already exists for that email."),
//                                 );
//                               });
//                         }
//                       } catch (e) {
//                         setState(() {
//                           _emailError = e.toString();
//                         });
//                       }
//                     }
//                   },
//                   child: Text("Sign In"))
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
