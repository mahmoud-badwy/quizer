import 'package:flutter/material.dart';

class MyDialog {
  Future<void> showMyDialog({
    conu,
    required String title,
    required String bodytext,
    required String button1,
    required String button2,
    required String button3,
    required VoidCallback button1f,
    required VoidCallback button2f,
  }) async {
    return showDialog<void>(
      context: conu,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext conu) {
        return AlertDialog(
          title: Text(title),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(bodytext),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(button1),
              onPressed: () {
                button1f();
              },
            ),
            const SizedBox(
              width: 20,
            ),
            TextButton(
              child: Text(button3),
              onPressed: () {
                button2f();
              },
            ),
            const SizedBox(
              width: 20,
            ),
            TextButton(
              child: Text(button2),
              onPressed: () {
                Navigator.of(conu).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> showMyDialog2({
    conu,
    required String title,
    required String bodytext,
    required String button1,
    required String button2,
    required VoidCallback button1f,
  }) async {
    return showDialog<void>(
      context: conu,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext conu) {
        return AlertDialog(
          title: Text(title),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(bodytext),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(button1),
              onPressed: () {
                button1f();
              },
            ),
            const SizedBox(
              width: 100,
            ),
            TextButton(
              child: Text(button2),
              onPressed: () {
                Navigator.of(conu).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
