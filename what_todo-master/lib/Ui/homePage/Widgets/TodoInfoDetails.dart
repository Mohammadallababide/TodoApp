import 'package:flutter/material.dart';

class TodoInfoDetails extends StatelessWidget {
  final String title;
  final String descriptions;
  final String text;

  TodoInfoDetails({
    @required this.title,
    @required this.descriptions,
    @required this.text,
  });
  @override
  Widget build(BuildContext context) {
    final Size sizeAware = MediaQuery.of(context).size;
    return ListView(
      padding: EdgeInsets.only(top: sizeAware.height * 0.04),
      children: <Widget>[
        Align(
          alignment: Alignment.topCenter,
          child: Text(
            '12/12/2020',
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
          ),
        ),
        SizedBox(
          height: sizeAware.height * 0.02,
        ),
        Text(
          title,
          style: TextStyle(fontSize: 23, fontWeight: FontWeight.w600),
        ),
        SizedBox(
          height: sizeAware.height * 0.02,
        ),
        Text(
          descriptions,
          style: TextStyle(fontSize: 18),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: sizeAware.height * 0.3,
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: FlatButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                text,
                style: TextStyle(fontSize: 18),
              )),
        ),
      ],
    );
  }
}
