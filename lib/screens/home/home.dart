import 'package:flutter/material.dart';
import 'package:flutter_app/services/auth.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[100],
      appBar: AppBar(
        title: Text('You are logged in'),
        backgroundColor: Colors.orange[400],
        actions: [
          Container(
            margin: EdgeInsets.only(right: 10),
            child: IconButton(
              tooltip: 'Log out',
              icon: Icon(Icons.logout),
              onPressed: _auth.signOut,
            ),
          )
        ],
      ),
      // child: Text('home'),
    );
  }
}
