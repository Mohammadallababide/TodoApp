import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'SharedPreferences.dart';

class ServerApi {
  ServerApi._() {
    getLocalToken();
  }
  String language;
  static String accessToken;
  static final ServerApi apiClient = ServerApi._();
  static final http.Client _httpClient = http.Client();

  static const BaseUrl = "AIzaSyA3-RBLyg2-jLllnveu4e7LH9rwedd59y8";
  Map<String, String> getHeaders() {
    return {
      "Authorization": accessToken,
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    };
  }

  Future<void> getLocalToken() async {
    accessToken = await SharedPref.pref.getToken();
  }
  Future<String> singUp(String email, String password) async {
    try {
      final bodyReq = jsonEncode({
        "email": email,
        "password": password,
        "returnSecureToken": true,
      });
      final response = await _httpClient.post(
        "https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=$BaseUrl",
        body: bodyReq,
        headers: {
          'Content-Type': 'application/json',
        },
      );
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        SharedPref.pref.saveToken(json['idToken']);

        return "sucess";
      } else {
        return Future.error("error");
      }
    } on SocketException {
      //this in case internet problems
      return Future.error("check your internet connection");
    } on http.ClientException {
      //this in case internet problems
      return Future.error("check your internet connection");
    } catch (e) {
      print(e.toString());
      return Future.error(e.toString());
    }
  }

  Future<String> singIn(String email, String password) async {
    try {
      final bodyReq = jsonEncode({
        'email': email,
        'password': password,
        'returnSecureToken': true,
      });
      final response = await _httpClient.post(
        "https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=$BaseUrl",
        body: bodyReq,
        headers: {
          'Content-Type': 'application/json',
        },
      );
      print(response.body);

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        if (json.containsKey('idToken')) {
          SharedPref.pref.saveToken(json['idToken']);
          return "sucess";
        } else if (json['error']['message'] == 'EMAIL_NOT_FOUND') {
          return 'This email was not found.';
        } else if (json['error']['message'] == 'INVALID_PASSWORD') {
          return 'The password is invalid.';
        }
      } else {
        return Future.error("error");
      }
    } on SocketException {
      //this in case internet problems
      return Future.error("check your internet connection");
    } on http.ClientException {
      //this in case internet problems
      return Future.error("check your internet connection");
    } catch (e) {
      print(e.toString());
      return Future.error(e.toString());
    }
  }
}
