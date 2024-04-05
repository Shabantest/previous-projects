import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/i10/local_keys.g.dart';
import 'package:graduation_project/view/componants/material_Button.dart';
import 'package:graduation_project/view_model/cubit/user_cubit/user_cubit.dart';
import 'package:graduation_project/view_model/cubit/user_cubit/user_state.dart';
import 'package:graduation_project/view_model/uitils/Colors.dart';
import 'package:graduation_project/view_model/uitils/images.dart';
import '../../../../view_model/uitils/Text_custom.dart';

class PromoCodeScreen extends StatelessWidget {
  const PromoCodeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(237, 247, 236, 1),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(237, 247, 236, 1),
        title: Row(
          children: [
            Expanded(
              child: TextCustom(
                text: LocaleKeys.YourPromoCode.tr(),
                color: AppColors.Orange,
                fontWeight: FontWeight.bold,
                fontSize: 20.sp,
              ),
            ),
           Image.asset(AppImages.a_promocode,width: 30.w,height: 30.h,color: AppColors.green,),
          ],
        ),
      ),
      body: BlocBuilder<UserCubit,UserStates>(
        builder: (context, state) {
          var cubit= UserCubit.get(context);
          return  Padding(
            padding:    EdgeInsetsDirectional.symmetric(horizontal: 12.w,vertical: 10.h),
            child: Column(children: [
              Image.asset(AppImages.promoCode),
             TextFormField(
               controller: cubit.promoCodeController,
               decoration: InputDecoration(
                 hintText:" xxxxx" ,
                 hintStyle:  const TextStyle(
                   color: AppColors.green,
                 ),
                 label: TextCustom(
                   text: LocaleKeys.promoCode.tr(),
                 ),
                 labelStyle:  const TextStyle(
                   color: Colors.orangeAccent,
                 ),
                 border: OutlineInputBorder(
                   borderRadius: BorderRadius.circular(15.r),
                   borderSide:  BorderSide(color:Colors.blue,width: 1.w),
                 )
               ),
             ),
                SizedBox(height: 50.h,),
              Padding(
                padding:   EdgeInsetsDirectional.symmetric(horizontal: 40.h),
                child: MaterialButtonCusttom(
                  text: LocaleKeys.Send.tr(),
                  color: Colors.blue,
                  textcolor: Colors.white,
                  onPressed: () {

                  },
                ),
              ),
            ],),
          );
        },
      ),
    );
  }
}
