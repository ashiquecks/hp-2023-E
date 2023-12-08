import 'package:flutter/material.dart';

showAlertDialogOne({
  required String message,
  required BuildContext context,
}) {
  AlertDialog alert = AlertDialog(
      content: Row(
    children: [
      // CircularProgressIndicator(
      //   color: Colors.green,
      // ),

      Text(message)
    ],
  ));

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      Future.delayed(const Duration(seconds: 3), () {
        Navigator.of(context).pop(true);
      });
      return alert;
    },
  );
}
