import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String text;
  final Function click;
  final bool showProgress;
  MyButton(this.text, this.click, {this.showProgress = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: RaisedButton(
          color: Colors.blue,
          child: showProgress
              ? Center(
                  child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white)))
              : Text(
                  text,
                  style: TextStyle(color: Colors.white, fontSize: 22),
                ),
          onPressed: click),
    );
  }
}
