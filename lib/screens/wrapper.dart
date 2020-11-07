import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/screens/auth/auth.dart';
import 'package:flutter_app/screens/home/home.dart';
import 'package:provider/provider.dart';

class FirebaseWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    print(user);

    if (user == null) {
      return Auth();
    }

    return Home();
  }
}
