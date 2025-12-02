import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/src/widgets/editable_text.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future<User?> signUp(String email, String password, String name) async {
    UserCredential userCredential =
    await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    return userCredential.user;
  }

  Future<User?> signIn(String email, String password, {required TextEditingController emailController}) async {
    UserCredential userCredential =
    await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return userCredential.user;
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }

  User? get currentUser => _auth.currentUser;
}
