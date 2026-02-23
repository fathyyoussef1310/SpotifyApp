import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(Authinitail());

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> login(String email, String password) async {
    try {
      emit(AuthLoading());

      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      String? token = await userCredential.user?.getIdToken();
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool("completeAuth", true);
      emit(AuthAuthenticated(token: token));
    } on FirebaseAuthException catch (e) {
      emit(AuthUnAuthenticated(error: e.message ?? "Authentication failed"));
    } catch (e) {
      emit(AuthUnAuthenticated(error: e.toString()));
    }
  }
  Future<void> logout() async {
    await _auth.signOut();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove("completeAuth");
    emit(AuthUnAuthenticated(error: "Logged out"));
  }
}