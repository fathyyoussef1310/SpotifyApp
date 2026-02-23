import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    final FirebaseAuth _auth= FirebaseAuth.instance;
    on<LoginReguest>((event, emit) async{
      try{
        emit(AuthLoading());
        UserCredential userCredential= await _auth.signInWithEmailAndPassword(
            email: event.email,
            password: event.Password
        );
        final String token= userCredential.user!.uid;
        SharedPreferences _prefs= await SharedPreferences.getInstance();
        _prefs.setBool("completeAuth", true);
        _prefs.setString("token", "token");
        emit(AuthAuthenticated(token: token));
      } on FirebaseAuthException catch(e){
        emit(AuthUnAuthenticated(error: e.message ?? "An unknown error occurred"));
      }catch(e){
        emit(AuthUnAuthenticated(error: e.toString()));
      }
    });
    on<Logout>((event, emit) async{
      _auth.signOut();
      final SharedPreferences _prefs= await SharedPreferences.getInstance();
      _prefs.remove("completeAuth");
      emit(AuthUnAuthenticated(error: "Logged out"));
    });
  }
}
