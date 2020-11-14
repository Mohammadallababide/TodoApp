part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class SingUp extends AuthEvent {
  final String email;
  final String password;

  SingUp({@required this.email, @required this.password});
}

class SingIn extends AuthEvent {
  final String email;
  final String password;

  SingIn({@required this.email, @required this.password});
}

class CheckLogin extends AuthEvent {}
