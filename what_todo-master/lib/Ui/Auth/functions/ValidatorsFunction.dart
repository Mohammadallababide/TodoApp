import 'package:flutter/material.dart';

String validateEmail(String value) {
  Pattern pattern =
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
      r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
      r"{0,253}[a-zA-Z0-9])?)*$";
  RegExp regex = new RegExp(pattern);
  if (!regex.hasMatch(value) || value == null)
    return 'Enter a valid email address';
  else
    return null;
}

String validatePassword(String value) {
  if (value.length < 6) {
    return 'the password must be more than 6 charecter';
  } else {
    return null;
  }
}

String validateConfirmPassword(String value) {
  if (value.length < 3) {
    return 'the password not much with confirm password';
  } else {
    return null;
  }
}

String validateTodo(String value) {
  if (value == null) {
    return 'this field shoud not be empty';
  } else {
    return null;
  }
}
