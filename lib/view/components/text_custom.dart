import 'package:flutter/material.dart';

import '../../view_model/uitils/colors.dart';
class TextCustom extends StatelessWidget {
  String? text;
  Color? color=AppColors.black;
  double? size;
  FontWeight? fontWeight;
  TextCustom({this.text, this.color, this.size=16, this.fontWeight,super.key});

  @override
  Widget build(BuildContext context) {
    return   Text('$text'??'',
    style:TextStyle(
      color: color,
      fontSize: size,
      fontWeight: fontWeight,
    ),

    );
  }
}
