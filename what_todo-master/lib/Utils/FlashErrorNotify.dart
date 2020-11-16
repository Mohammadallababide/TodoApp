import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';

Widget getFlashBarNotify(BuildContext context,  {String text = 'Check from you Connection NetWork'}) {
  return Flushbar(
    message: text,
    
    icon: Icon(
      Icons.info_outline,
      size: 28.0,
      color: Colors.blue[300],
    ),
    flushbarStyle: FlushbarStyle.FLOATING,
    flushbarPosition: FlushbarPosition.TOP,
    duration: Duration(seconds: 3),
    leftBarIndicatorColor: Colors.blue[300],
  )..show(context);
}
