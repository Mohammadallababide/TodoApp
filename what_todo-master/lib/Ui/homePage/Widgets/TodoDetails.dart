import 'package:flutter/material.dart';

import 'customDialog.dart';

void showTodoDetails(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return CustomDialogBox(
            title: "Custom Dialog Demo",
            descriptions:
                "Hii all this is a custom dialog in flutter and  you will be use in your flutter applications",
            text: "Ok",
          );
        },
      );
    },
  );
}
