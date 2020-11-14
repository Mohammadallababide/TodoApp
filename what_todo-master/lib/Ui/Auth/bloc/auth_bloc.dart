import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:what_todo/data/ServerApi.dart';
import 'package:what_todo/data/SharedPreferences.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial());

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    if (event is SingUp) {
      String error;
      yield SigningUp();
      await ServerApi.apiClient
          .singUp(event.email, event.password)
          .then((value) => {})
          .catchError((onError) {
        error = onError.toString();
      });
      if (error == null) {
        yield SucessSignUp();
      } else {
        yield ErrorSignUp(error);
      }
    }
    if (event is SingIn) {
      String error;
      yield SigningIn();
      await ServerApi.apiClient
          .singIn(event.email, event.password)
          .then((value) => {})
          .catchError((onError) {
        error = onError.toString();
      });
      if (error == null) {
        yield SucessSignIn();
      } else {
        yield ErrorSignIn(error);
      }
    }
    if (event is CheckLogin) {
      yield CheckingLogin();
      final result = await SharedPref.pref.checkLogin();
      if(result == null){
        yield NotHaveLogin();
      }else{
        yield HaveLogin();
      }
    }
  }
}
