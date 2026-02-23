part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}
class LoginReguest extends AuthEvent{
  final String email;
  final String Password;
  LoginReguest({required this.Password,required this.email});
}
class Logout extends AuthEvent{}
