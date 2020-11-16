import 'package:flutter/material.dart';
import 'package:what_todo/model/Todo.dart';

import 'customDialog.dart';

void showTodoDetails(
  BuildContext context,
  Todo todo,
) {
  showDialog(
    context: context,
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return CustomDialogBox(
            todo:todo,
            text: "Ok",
          );
        },
      );
    },
  );
}
