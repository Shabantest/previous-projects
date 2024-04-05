import 'package:flutter/material.dart';

class TextButtonCustom extends StatelessWidget {
  String text;
  void Function()? onPressed;
    TextStyle ? style =const TextStyle();
   TextButtonCustom({this.onPressed,required this.text,  this.style,super.key});
  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: onPressed,
        child: Text(text,style: style,),

    );
  }
}
