import 'package:flutter/material.dart';
import 'package:what_todo/model/Todo.dart';

class TodoInfoDetails extends StatelessWidget {
  final Todo todo;
  final String text;

  TodoInfoDetails({
    @required this.todo,
    @required this.text,
  });
  @override
  Widget build(BuildContext context) {
    final Size sizeAware = MediaQuery.of(context).size;
    return Column(
      children: [
        Expanded(
          child: ListView(
            padding: EdgeInsets.only(top: sizeAware.height * 0.04),
            children: <Widget>[
              Align(
                alignment: Alignment.topCenter,
                child: Text(
                  todo.createdTime,
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(
                height: sizeAware.height * 0.02,
              ),
              Text(
                todo.title,
                style: TextStyle(fontSize: 23, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: sizeAware.height * 0.02,
              ),
              Text(
                todo.descraption,
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.left,
              ),
              SizedBox(
                height: sizeAware.height * 0.1,
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: SizedBox(
            width: sizeAware.width * 0.2,
            child: FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  text,
                  style: TextStyle(fontSize: 18),
                )),
          ),
        ),
      ],
    );
  }
}
