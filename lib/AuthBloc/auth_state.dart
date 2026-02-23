part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}
final class AuthLoading extends AuthState{}
final class AuthAuthenticated extends AuthState {
  final String? token;
  AuthAuthenticated({required this.token});
}
final class AuthUnAuthenticated extends AuthState {
  final String error;
  AuthUnAuthenticated({required this.error});
}
