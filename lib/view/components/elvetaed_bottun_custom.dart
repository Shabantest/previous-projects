
import 'package:flutter/material.dart';
import 'package:todo_app/view/components/text_custom.dart';

import '../../view_model/uitils/colors.dart';

class ElevatedButtonCustom extends StatelessWidget {
  String? text;
  Function()? onPressed;
  EdgeInsetsDirectional? margin ;
  double? width;
  double? height;
  ElevatedButtonCustom({this.height,this.width, this.text, this.onPressed, this.margin, super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: width,
      height: height,
      margin:margin ,
      child: ElevatedButton(
        onPressed:onPressed ,
        child:
        TextCustom(text: text??'', color: AppColors.white),
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(

          ),
          backgroundColor: AppColors.green,
        ),
      ),
    );
  }
}


