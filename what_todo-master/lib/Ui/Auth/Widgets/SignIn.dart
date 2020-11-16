import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:what_todo/Ui/Auth/bloc/auth_bloc.dart';
import '../../../Utils/functions/ValidatorsFunction.dart';
import 'package:what_todo/Utils/FlashErrorNotify.dart';

class SigInWidget extends StatefulWidget {
  Function callback;
  SigInWidget(this.callback);
  @override
  _SigInWidgetState createState() => _SigInWidgetState();
}

class _SigInWidgetState extends State<SigInWidget> {
  final AuthBloc authBloc = AuthBloc();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String email;
  String password;
  @override
  Widget build(BuildContext context) {
    final Size sizeAware = MediaQuery.of(context).size;
    return Form(
      key: _formKey,
      child: Column(children: [
        Padding(
          padding: EdgeInsets.only(
            left: sizeAware.width * 0.05,
            right: sizeAware.width * 0.05,
            top: sizeAware.height * 0.15,
            bottom: sizeAware.height * 0.02,
          ),
          child: Container(
            height: sizeAware.height * 0.1,
            width: sizeAware.width * 0.9,
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.1),
              borderRadius: BorderRadius.circular(25),
            ),
            child: Padding(
              padding: EdgeInsets.only(top: sizeAware.height * 0.025),
              child: TextFormField(
                autofocus: false,
                onSaved: (value) {
                  this.email = value;
                },
                textAlign: TextAlign.right,
                validator: validateEmail,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(left: 15, right: 15),
                  labelText: 'email',
                  labelStyle: TextStyle(
                    color: Colors.grey,
                  ),
                  disabledBorder: InputBorder.none,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(25.0),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: sizeAware.width * 0.05,
              vertical: sizeAware.height * 0.05),
          child: Container(
            height: sizeAware.height * 0.1,
            width: sizeAware.width * 0.9,
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.1),
              borderRadius: BorderRadius.circular(25),
              // border: Border.all(color: Colors.blueAccent),
            ),
            child: Padding(
              padding: EdgeInsets.only(top: sizeAware.height * 0.025),
              child: TextFormField(
                validator: validatePassword,
                autofocus: false,
                onSaved: (value) {
                  this.password = value;
                },
                obscureText: true,
                textAlign: TextAlign.right,
                decoration: new InputDecoration(
                  disabledBorder: InputBorder.none,
                  contentPadding: EdgeInsets.only(left: 15, right: 15),
                  labelText: 'password',
                  labelStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                    borderRadius: const BorderRadius.all(
                      const Radius.circular(25.0),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        BlocListener(
          cubit: authBloc,
          listener: (context, state) {
            if (state is SucessSignIn) {
              Navigator.pushReplacementNamed(context, '/homePage');
            } else if (state is ErrorSignIn) {
              getFlashBarNotify(context);
            }
          },
          child: BlocBuilder(
            cubit: authBloc,
            builder: (context, state) {
              if (state is SigningIn) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return InkWell(
                  child: Container(
                    height: sizeAware.height * 0.08,
                    width: sizeAware.width * 0.6,
                    child: Center(
                      child: Text(
                        'SigIn',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Theme.of(context).primaryColor),
                  ),
                  onTap: () => submitForm(),
                );
              }
            },
          ),
        ),
        SizedBox(height: sizeAware.height * 0.02),
        FlatButton(
            onPressed: () {
              this.widget.callback(false);
            },
            child: Text('I don\'t have account on Todo',
                style: TextStyle(
                  color: Colors.blueAccent,
                ))),
      ]),
    );
  }

  void submitForm() {
    if (!_formKey.currentState.validate()) {
      getFlashBarNotify(context, text: 'معلومات الأدخل غير كاملة أو غير صحيحة ');
    } else {
      _formKey.currentState.save();
      authBloc.add(
        SingIn(
          email: email,
          password: password,
        ),
      );
    }
  }
}
