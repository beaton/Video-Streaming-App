import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[400],
      floatingActionButton: FloatingActionButton(onPressed: () {}),
      body: Center(
          child: Text(
        this.runtimeType.toString(),
        style: TextStyle(fontSize: 23.0, fontWeight: FontWeight.bold),
      )),
    );
  }
}
