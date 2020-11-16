import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:what_todo/Ui/Auth/Pages/Rigester.dart';
import 'package:what_todo/Ui/NewTodo/Pages/NewTodo.dart';
import 'package:what_todo/Ui/homePage/Pages/homepage.dart';
import '../Ui/Auth/Pages/IntroPage.dart';

class TodoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const MaterialColor myPrimaryColor = const MaterialColor(0xFF09AFD9, {
      50: Color.fromRGBO(9, 175, 217, .1),
      100: Color.fromRGBO(9, 175, 217, .2),
      200: Color.fromRGBO(9, 175, 217, .3),
      300: Color.fromRGBO(9, 175, 217, .4),
      400: Color.fromRGBO(9, 175, 217, .5),
      500: Color.fromRGBO(9, 175, 217, .6),
      600: Color.fromRGBO(9, 175, 217, .7),
      700: Color.fromRGBO(9, 175, 217, .8),
      800: Color.fromRGBO(9, 175, 217, .9),
      900: Color.fromRGBO(9, 175, 217, 1),
    });

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'TodoApp',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          primaryColor: myPrimaryColor,
          accentColor: myPrimaryColor,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          textTheme: GoogleFonts.nunitoSansTextTheme(
            Theme.of(context).textTheme,
          ),
        ),
        routes: {
          // intro for check login ...
          '/': (BuildContext context) => IntroPage(),
          '/Rigester': (BuildContext context) => Rigester(),
          '/homePage': (BuildContext context) => Homepage(),
          '/newTodo': (BuildContext context) => NewTodoPage(),
        });
  }
}
