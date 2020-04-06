import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  String text;
  Function click;
  MyButton(
    this.text,
    this.click,
  );

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        color: Colors.blue,
        child: Text(
          text,
          style: TextStyle(color: Colors.white, fontSize: 22),
        ),
        onPressed: click);
  }
}