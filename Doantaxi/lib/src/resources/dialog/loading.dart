import 'package:flutter/material.dart';

class LoadingDialog{
  static void showLoadingDialog(BuildContext context, String mess){
    showDialog(context: context, barrierDismissible: false, builder: (context) => new Dialog(
      child: Container(
        color: Colors.white,
        height: 80,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircularProgressIndicator(),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: Text(
                mess,
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    ));
  }
  static void hideShowDialog(BuildContext context){
    Navigator.of(context).pop(LoadingDialog);
  }
}