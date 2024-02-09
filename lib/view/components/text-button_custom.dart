import 'package:flutter/material.dart';
import 'package:todo_app/view/components/text_custom.dart';
class TextButtonCustom extends StatelessWidget {
  String? text;
  Function()? onPressed;
  Color? textColor;
  TextButtonCustom({this.text, this.onPressed, this.textColor,super.key});
  @override
  Widget build(BuildContext context) {
    return  TextButton(onPressed: onPressed,
      child: TextCustom( text: text??'',
        color:textColor!,
      ),
    );
  }
}
