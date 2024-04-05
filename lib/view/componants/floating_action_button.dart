import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../view_model/uitils/Colors.dart';
import '../../view_model/uitils/icons.dart';

class FloatingActionButtonCustom extends StatelessWidget {
   void Function()? onPressed;
   FloatingActionButtonCustom({ this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadiusDirectional.circular(17.r)),
      heroTag: "btn1",
        onPressed: onPressed,
      backgroundColor: AppColors.Orange,
      child: AppIcons.add,
    );
  }
}
