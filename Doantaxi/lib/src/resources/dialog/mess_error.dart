import 'package:flutter/material.dart';

class MessErrorDialog{
  static void showMessErrorDialog(BuildContext context, String title, String mess){
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
            title: Text(title),
            content: Text(mess),
          actions: <Widget>[
            FilledButton(
              child: Text("OK"),
              onPressed: (){
                Navigator.of(context).pop(MessErrorDialog);
              },
            )
          ],
    ));
  }
}