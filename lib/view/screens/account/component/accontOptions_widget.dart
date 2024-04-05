import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/view_model/uitils/Colors.dart';
import 'package:graduation_project/view_model/uitils/Text_custom.dart';
import '../../../../../model/account_model/accountOptions_model.dart';
class AccountOptionsWidget extends StatelessWidget {
  final AccountOptionsModel accountOptions;
  void Function()? onPressed;
   AccountOptionsWidget({required this.accountOptions,this.onPressed, super.key});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Column(
        children: [
          Padding(
            padding:  EdgeInsets.symmetric(vertical: 16.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(accountOptions.icon!,width: 30.w,height: 30.h,),
                 SizedBox(width: 6.w),
                Expanded(child: TextCustom(
                  text: accountOptions.name!.tr(),
                  fontSize: 20.sp,
                  color: AppColors.black,
                )),
                accountOptions.nextArrow!,
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
