import 'package:flutter/material.dart';

import 'TodoDetails.dart';

class TodoCard extends StatefulWidget {
  @override
  _TodoCardState createState() => _TodoCardState();
}

class _TodoCardState extends State<TodoCard> {
  @override
  Widget build(BuildContext context) {
    final Size sizeAware = MediaQuery.of(context).size;
    return InkWell(
      onTap: () => showTodoDetails(context),
      child: Padding(
        padding: EdgeInsets.only(bottom: sizeAware.height * 0.05),
        child: Material(
          elevation: 0.7,
          borderRadius: BorderRadius.circular(25),
          child: Container(
              height: sizeAware.height * 0.2,
              width: sizeAware.width * 0.9,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: sizeAware.width * 0.05),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text('12/12/2020'),
                    ),
                  ),
                  SizedBox(
                    height: sizeAware.height * 0.03,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: sizeAware.width * 0.07),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'todo title',
                          style: TextStyle(
                            fontSize: 22,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Checkbox(
                          value: false,
                          onChanged: (v) {},
                          activeColor: Theme.of(context).primaryColor,
                        )
                      ],
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
