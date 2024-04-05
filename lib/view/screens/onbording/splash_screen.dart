import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/i10/local_keys.g.dart';
import 'package:graduation_project/view/componants/bottom_navigaton_bar.dart';
import 'package:graduation_project/view_model/data/local/shared_helper.dart';
import 'package:graduation_project/view_model/data/local/shared_keyes.dart';
import '../../../view_model/uitils/Colors.dart';
import '../../../view_model/uitils/Text_custom.dart';
import '../../../view_model/uitils/navigation.dart';
import 'on_bording.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2,),
          () {
          if(SharedHelper.get(key: SharedKeys.userToken)==null){
            Navigation.pushAndremove(context, const OnBoarding());
          }else{
            Navigation.pushAndremove(context, const BottomNavigationCustom());
          }
      },);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.Orange,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextCustom(
              text: LocaleKeys.VeggieMarket.tr(),
              fontWeight: FontWeight.bold,
              fontSize: 24.sp,
              color: AppColors.white,
            ),
          ],
        ),
        ),
    );
  }
}
