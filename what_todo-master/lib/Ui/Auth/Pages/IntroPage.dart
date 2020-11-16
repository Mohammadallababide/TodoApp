import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:what_todo/Ui/Auth/bloc/auth_bloc.dart';

class IntroPage extends StatefulWidget {
  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  final AuthBloc authBloc = AuthBloc();
  @override
  void initState() {
    authBloc.add(CheckLogin());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size sizeAware = MediaQuery.of(context).size;
    return BlocListener(
        listener: (context, state) {
          if (state is HaveLogin) {
            Navigator.pushReplacementNamed(context, '/homePage');
          } else if (state is NotHaveLogin) {
            Navigator.pushReplacementNamed(context, '/Rigester');
          }
        },
        cubit: authBloc,
        child: Scaffold(
          body: Container(
            height: sizeAware.height,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  'https://repository-images.githubusercontent.com/105165445/b8efdd00-5d13-11e9-902e-3ce3c3d7e548',
                ),
                fit: BoxFit.fill,
              ),
            ),
            child: Container(),
          ),
        ));
  }
}
