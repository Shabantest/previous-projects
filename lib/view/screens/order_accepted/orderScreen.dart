import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/view_model/uitils/Colors.dart';
import '../../../../view_model/uitils/Text_custom.dart';
import '../../../../view_model/uitils/images.dart';
import '../../../../view_model/uitils/navigation.dart';
import '../../componants/bottom_navigaton_bar.dart';
import '../../componants/material_Button.dart';
import '../../componants/text_button.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:  EdgeInsets.all(20.w),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(AppImages.orederAccepted),
              TextCustom(
             text:    "Your Order has been accepted",
               fontSize: 22.sp,
                color: CupertinoColors.black,
                fontWeight: FontWeight.bold,
                textAlign: TextAlign.center,
              ),
              TextCustom(
              text:   "Your items has been placcd and is on \n it’s way to being processed",
                fontWeight: FontWeight.bold,
                fontSize: 15.sp,
                color: AppColors.gray,
                textAlign: TextAlign.center,
              ),
              MaterialButtonCustom(
                color: AppColors.green,
                textColor: AppColors.white,
                text: "Track Order",
                onPressed: () {
                },
              ),
              TextButtonCustom(
                style: const TextStyle(color: AppColors.green),
                text: "Back to home",
                onPressed: () {
                  Navigation.push(context, const BottomNavigationCustom());
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
