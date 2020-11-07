import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Stream<User> get user => _auth.authStateChanges();

  Future signInAnonymously() async {
    try {
      await _auth.signInAnonymously();
    } catch (e) {
      print(e.toString());
    }
  }

  Future signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }
}
