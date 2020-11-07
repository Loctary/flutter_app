import 'package:flutter/material.dart';
import 'package:flutter_app/services/auth.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  bool isLoading = false;

  onAnonymousLogin() async {
    setState(() {
      isLoading = true;
    });
    await _auth.signOut();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[100],
      appBar: AppBar(
        backgroundColor: Colors.orange[400],
        title: Text('Sign In'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
        child: RaisedButton(
          onPressed: _auth.signInAnonymously,
          child: Text('Sign In Anonomysly'),
        ),
      ),
    );
  }
}
