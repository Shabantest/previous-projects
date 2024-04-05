import 'package:flutter/material.dart';

class Navigation {
  static void push(context, Widget nextScreen) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => nextScreen,
        ));
  }

  static void pushAndremove(context, Widget nextScreen) {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => nextScreen,
        ),
        (route) => false);
  }
  static void pop(context){
    Navigator.pop(context);
  }
}
