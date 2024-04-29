import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../view_model/uitils/Colors.dart';

class MaterialButtonCustom extends StatelessWidget {
  String text;
  Color? color;
  Color? textColor;
  IconData? icon;
  void Function()? onPressed;
  MaterialButtonCustom(
      {this.textColor,
        this.icon,
      this.color,
      this.onPressed,
      required this.text,
      super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialButton(

      highlightColor:  AppColors.Orange,
      onPressed: onPressed,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusDirectional.circular(19.r),
      ),
      height: 55.h,
      minWidth: 353.w,
      textColor: textColor,
      color: color,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children:[
          Text(
          text,
          style:  TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w400),
        ),
      ]
      ),
    );
  }
}
