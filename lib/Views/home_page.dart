import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Carros',
          style: TextStyle(fontSize: 25),
        ),
      ),
    );
  }
}
