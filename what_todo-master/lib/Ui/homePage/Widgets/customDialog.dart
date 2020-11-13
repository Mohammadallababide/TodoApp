import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'TodoEditInfoDetails.dart';
import 'TodoInfoDetails.dart';

class CustomDialogBox extends StatefulWidget {
  final String title, descriptions, text;
  final Image img;

  const CustomDialogBox(
      {Key key, this.title, this.descriptions, this.text, this.img})
      : super(key: key);

  @override
  _CustomDialogBoxState createState() => _CustomDialogBoxState();
}

class _CustomDialogBoxState extends State<CustomDialogBox> {
  bool isEdit = false;
  @override
  Widget build(BuildContext context) {
    final Size sizeAware = MediaQuery.of(context).size;
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context, sizeAware),
    );
  }

  contentBox(context, Size sizeAware) {
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 20, top: 5, right: 20, bottom: 0),
          margin: EdgeInsets.only(top: 45),
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                    color: Colors.black, offset: Offset(0, 10), blurRadius: 10),
              ]),
          child: Expanded(
            child: Column(
              children: [
                !isEdit
                    ? Align(
                        alignment: Alignment.topRight,
                        child: IconButton(
                          icon: Icon(Icons.edit),
                          onPressed: () {
                            setState(() {
                              isEdit = true;
                            });
                          },
                        ),
                      )
                    : Container(),
                isEdit
                    ? Align(
                        alignment: Alignment.topLeft,
                        child: SizedBox(
                          width: sizeAware.width * 0.19,
                          child: FlatButton(
                            child: Text(
                              'Back',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                              ),
                            ),
                            onPressed: () {
                              setState(() {
                                isEdit = false;
                              });
                            },
                          ),
                        ),
                      )
                    : Container(),
                Expanded(
                  child: isEdit
                      ? EditTodoInfoDetails(
                          title: widget.title,
                          descriptions: widget.descriptions,
                          text: widget.text,
                        )
                      : TodoInfoDetails(
                          title: widget.title,
                          descriptions: widget.descriptions,
                          text: widget.text,
                        ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          left: 20,
          right: 20,
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: 45,
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(45)),
              child: Image.asset("assets/images/logo.png"),
            ),
          ),
        ),
      ],
    );
  }
}
