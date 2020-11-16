import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:what_todo/model/Todo.dart';

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

  // Auth ....
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
        SharedPref.pref.saveUserId(json['localId']);

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
          SharedPref.pref.saveUserId(json['localId']);
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

  // fetch todo list for register user
  Future<List<Todo>> getTodos() async {
    try {
      final response = await _httpClient.get(
        'https://mytodo-913d4.firebaseio.com/mytodo-913d4.json',
      );
      if (response.statusCode == 200) {
        print(response.body);
        final Map<String, dynamic> fireData = jsonDecode(response.body);
        final List<Todo> todoList = [];
        fireData.forEach((
          String todoId,
          dynamic value,
        ) {
          final Todo todo = Todo(
            id: todoId,
            title: value['title'],
            descraption: value['descraption'],
            createdTime: value['createdTime'],
            isDone: value['isDone'],
            ownerId: value['ownerId'],
          );
          todoList.add(todo);
        });
        return todoList.where((Todo todo) {
          return todo.ownerId == SharedPref.userId;
        }).toList();
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

  Future<bool> editTodo(Todo todo) async {
    try {
      final Map<String, dynamic> updateData = {
        "title": todo.title,
        "createdTime": todo.createdTime,
        "descraption": todo.descraption,
        "ownerId": SharedPref.userId,
        'isDone': todo.isDone ?? false,
      };
      final response = await _httpClient.put(
        'https://mytodo-913d4.firebaseio.com/mytodo-913d4/${todo.id}.json',
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(updateData),
      );
      if (response.statusCode == 200) {
        return true;
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

  Future<bool> addTodo(Todo todo) async {
    try {
      final bodyReq = jsonEncode({
        'title': todo.title,
        'createdTime': todo.createdTime,
        'descraption': todo.descraption,
        'isDone': false,
        "ownerId": SharedPref.userId,
      });
      final response = await _httpClient.post(
        "https://mytodo-913d4.firebaseio.com/mytodo-913d4.json",
        body: bodyReq,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      );
      if (response.statusCode == 200) {
        return true;
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
