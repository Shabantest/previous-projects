import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../view_model/uitils/Colors.dart';
import '../../../../../view_model/uitils/Text_custom.dart';
class CheckOutOptionsWidget extends StatelessWidget {
  final String? name;
  final String? title;
  final Icon? icon;
  void Function()? onPressed;

  CheckOutOptionsWidget({this.onPressed,this.title,this.name,this.icon, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Column(
        children: [
          Padding(
            padding:  EdgeInsets.symmetric(vertical: 16.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    child: TextCustom(
                  text: name ?? '',
                  fontSize: 15.sp,
                  color: AppColors.black,
                )),
                TextCustom(
                  text: title ?? '',
                  fontSize: 15.sp,
                  color: AppColors.black,
                ),
                icon!,
              ],
            ),
          ),
           Divider(
            color: AppColors.gray,
            height: 1.h,
          ),
        ],
      ),
    );

  }
}
