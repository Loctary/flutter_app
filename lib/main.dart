import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/screens/wrapper.dart';
import 'package:flutter_app/services/auth.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          print(snapshot.error);
          return Text(snapshot.error.toString());
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return StreamProvider<User>.value(
            value: AuthService().user,
            child: MaterialApp(
              home: FirebaseWrapper(),
            ),
          );
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return Container(
          color: Colors.orange[100],
          child: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
  // Widget build(BuildContext context) {
  //   return StreamProvider<User>.value(
  //     value: AuthService().user,
  //     child: MaterialApp(
  //       home: FirebaseWrapper(),
  //     ),
  //   );
  // }
}
