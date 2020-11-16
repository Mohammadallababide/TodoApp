import 'package:flutter/material.dart';
import 'package:what_todo/Ui/Auth/Widgets/SignIn.dart';
import 'package:what_todo/Ui/Auth/Widgets/SignUp.dart';

class Rigester extends StatefulWidget {
  @override
  _RigesterState createState() => _RigesterState();
}

class _RigesterState extends State<Rigester> {
  bool isSignIn = false;
  bool getIsSignIn(bool isSignIn) {
    setState(() {
      this.isSignIn = isSignIn;
    });
    return this.isSignIn;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size sizeAware = MediaQuery.of(context).size;
    return Scaffold(
      body: ListView(
        children: [
          Stack(
            overflow: Overflow.visible,
            children: [
              Container(
                height: sizeAware.height * 0.5,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      'https://repository-images.githubusercontent.com/105165445/b8efdd00-5d13-11e9-902e-3ce3c3d7e548',
                    ),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Column(
                children: [
                  SizedBox(height: sizeAware.height * 0.42),
                  Material(
                    elevation: 7,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(45.0),
                      topRight: Radius.circular(45.0),
                    ),
                    child: Container(
                      height: sizeAware.height * 0.72,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(45.0),
                          topRight: Radius.circular(45.0),
                        ),
                      ),
                      child: isSignIn
                          ? SigInWidget(this.getIsSignIn)
                          : SigUpWidget(this.getIsSignIn),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
