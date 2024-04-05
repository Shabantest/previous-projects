import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class TextCustom extends StatelessWidget {
  String? text;
  Color? color;
  double? fontSize;
  FontWeight? fontWeight;
  TextAlign? textAlign;
  double? height;
  TextCustom(
      {this.text,this.textAlign, this.color,this.height, this.fontSize, this.fontWeight, super.key});

  @override
  Widget build(BuildContext context) {
    return   Text(
        text!,
        style:TextStyle(
          height: height,
          fontSize:fontSize ,
          color: color,
          fontWeight:fontWeight ,
        ),
      textAlign: textAlign,

    );
  }
}

