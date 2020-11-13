import 'package:flutter/material.dart';
import 'package:what_todo/Ui/Auth/functions/ValidatorsFunction.dart';

class SigUpWidget extends StatefulWidget {
  Function callback;
  SigUpWidget(this.callback);
  @override
  _SigUpWidgetState createState() => _SigUpWidgetState();
}

class _SigUpWidgetState extends State<SigUpWidget> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String userName;
  String email;
  String password;
  @override
  Widget build(BuildContext context) {
    final Size sizeAware = MediaQuery.of(context).size;
    return Form(
      key: _formKey,
      child: Column(children: [
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: sizeAware.width * 0.05,
              vertical: sizeAware.height * 0.04),
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
                textAlign: TextAlign.right,
                validator: validateUserName,
                onSaved: (value) {
                  this.userName = value;
                },
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(left: 15, right: 15),
                  labelText: 'userName',
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
              vertical: sizeAware.height * 0.02),
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
                validator: validateEmail,
                onSaved: (value) {
                  this.email = value;
                },
                textAlign: TextAlign.right,
                decoration: new InputDecoration(
                  disabledBorder: InputBorder.none,
                  contentPadding: EdgeInsets.only(left: 15, right: 15),
                  labelText: 'email',
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
            ),
            child: Padding(
              padding: EdgeInsets.only(top: sizeAware.height * 0.025),
              child: TextFormField(
                autofocus: false,
                onSaved: (value) {
                  this.password = value;
                },
                obscureText: true,
                textAlign: TextAlign.right,
                validator: validatePassword,
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
        InkWell(
          child: Container(
            height: sizeAware.height * 0.08,
            width: sizeAware.width * 0.6,
            child: Center(
              child: Text(
                'SigUp',
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
        ),
        SizedBox(height: sizeAware.height * 0.02),
        FlatButton(
            onPressed: () {
              this.widget.callback(true);
            },
            child: Text('I alradey have account on Todo',
                style: TextStyle(
                  color: Colors.blueAccent,
                ))),
      ]),
    );
  }

  void submitForm() {
    if (!_formKey.currentState.validate()) {
      // todo define flashbar
//  getFlashBarNotify(context, text: 'معلومات الأدخل غير كاملة');
    } else {
      Navigator.pushReplacementNamed(context, '/homePage');
    }
  }
}
