part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class SigningUp extends AuthState {}

class SucessSignUp extends AuthState {}

class ErrorSignUp extends AuthState {
  final String error;
  ErrorSignUp(this.error);
}

class SigningIn extends AuthState {}

class SucessSignIn extends AuthState {}

class ErrorSignIn extends AuthState {
  final String error;
  ErrorSignIn(this.error);
}

class CheckingLogin extends AuthState {}

class HaveLogin extends AuthState {}

class NotHaveLogin extends AuthState {}
