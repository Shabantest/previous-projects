import 'package:flutter/material.dart';

class CustomNavigator {
  static void push(BuildContext context, Widget nextScreen) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => nextScreen,
        ));
  }

  static void pushReplacement(BuildContext context, Widget nextScreen) {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => nextScreen,
        ));
  }

  static void pushAndRemoveUtil(BuildContext context, Widget nextScreen) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => nextScreen,
      ),
      (route) => false,
    );
  }
}
