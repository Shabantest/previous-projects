import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/i10/local_keys.g.dart';
import '../../../view_model/uitils/Colors.dart';
import '../../../view_model/uitils/Text_custom.dart';
import '../../../view_model/uitils/images.dart';
import '../../../view_model/uitils/navigation.dart';
import '../../componants/material_Button.dart';
import '../auth/loging/login_screen.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(237, 247, 236,1),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
               SizedBox(height: 50.h,),
              Image.asset(AppImages.onboarding,height: 350.h,width:400.w,fit: BoxFit.contain,),
               SizedBox(height: 10.h,),
              TextCustom(
                text:LocaleKeys.BuyGroceriesEasillyWithUs.tr(),
                color: AppColors.black,
                fontSize: 25.sp,
                fontWeight: FontWeight.bold,
                textAlign: TextAlign.center,
                height: 1.2.h,
              ),
               SizedBox(height: 20.h,),
              Expanded(
                child: TextCustom(
                  text: LocaleKeys.BuyFoodOrGroceriesOnlineEaslyOnlyWithMobilePhone.tr(),
                  color: AppColors.gray,
                  fontSize: 15.sp,
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding:  EdgeInsets.only(right: 30.w, left: 30.w, bottom: 30.w),
                child: MaterialButtonCusttom(
                    color: AppColors.Orange,
                    textcolor: AppColors.white,
                    text:LocaleKeys.GetStarted.tr(),
                    onPressed: () {
                      Navigation.push(context, const LoginScreen());
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
