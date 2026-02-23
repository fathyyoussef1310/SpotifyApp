abstract class AuthState {}
class AuthLoading extends AuthState{}
class Authinitail extends AuthState{}
class AuthAuthenticated extends AuthState{
  final String? token;
  AuthAuthenticated({required this.token});
}
class AuthUnAuthenticated extends AuthState{
  final String error;
  AuthUnAuthenticated({required this.error});
}