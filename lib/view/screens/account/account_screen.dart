import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/i10/local_keys.g.dart';
import 'package:graduation_project/view/componants/text_button.dart';
import 'package:graduation_project/view_model/data/local/shared_helper.dart';
import 'package:graduation_project/view_model/data/local/shared_keyes.dart';
import '../../../../model/account_model/accountOptions_model.dart';
import '../../../../model/account_model/user_data_model.dart';
import '../../../../view_model/uitils/Colors.dart';
import '../../../../view_model/uitils/navigation.dart';
import '../../../view_model/cubit/user_cubit/user_cubit.dart';
import '../../../view_model/cubit/user_cubit/user_state.dart';
import '../../componants/material_Button.dart';
import '../auth/loging/login_screen.dart';
import 'component/accontOptions_widget.dart';
import 'component/user_data_widget.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.deepGreen,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  BlocBuilder<UserCubit, UserStates>(
                    builder: (context, state) {
                      var cubit = UserCubit.get(context);
                      return UserDataWidget();
                    },
                  ),
                   SizedBox(
                    height: 20.h,
                  ),
                  const Divider(
                    color: AppColors.gray,
                  ),
                  AccountOptionsWidget(
                    accountOptions: accountOptionsList[0],
                    onPressed: () {},
                  ),
                  AccountOptionsWidget(
                    accountOptions: accountOptionsList[1],
                    onPressed: () {},
                  ),
                  AccountOptionsWidget(
                    accountOptions: accountOptionsList[2],
                    onPressed: () {},
                  ),
                  AccountOptionsWidget(
                    accountOptions: accountOptionsList[3],
                    onPressed: () {},
                  ),
                  AccountOptionsWidget(
                    accountOptions: accountOptionsList[4],
                    onPressed: () {},
                  ),
                  AccountOptionsWidget(
                    accountOptions: accountOptionsList[5],
                    onPressed: () {},
                  ),
                  AccountOptionsWidget(
                    accountOptions: accountOptionsList[6],
                    onPressed: () {},
                  ),
                  AccountOptionsWidget(
                    accountOptions: accountOptionsList[7],
                    onPressed: () {},
                  ),
                  AccountOptionsWidget(
                    accountOptions: accountOptionsList[8],
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            backgroundColor: AppColors.deepGreen,
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  height: 50.h,
                                  width: double.infinity.w,
                                  decoration:  BoxDecoration(
                                    color: AppColors.deepGreen,
                                    borderRadius:  BorderRadiusDirectional.all(
                                        Radius.circular(12.r)),
                                    border:Border.all(
                                      width: 1.w,
                                      color: AppColors.gray,
                                    ),
                                  ),
                                  child: TextButtonCustom(
                                    style:  TextStyle(
                                      fontSize: 20.sp,
                                      color: AppColors.Orange,
                                    ),
                                    text: LocaleKeys.English.tr(),
                                    onPressed: () {
                                      context.setLocale(const Locale('en'));
                                    },
                                  ),
                                ),
                                 SizedBox(
                                  height: 15.h,
                                ),
                                Container(
                                  height: 50.h,
                                  width: double.infinity.w,
                                  decoration:  BoxDecoration(
                                    color: AppColors.deepGreen,
                                    borderRadius:  BorderRadiusDirectional.all(
                                        Radius.circular(12.r)),
                                    border:Border.all(
                                      width: 1.w,
                                      color: AppColors.gray,
                                    ),
                                  ),
                                  child: TextButtonCustom(
                                    style:  TextStyle(
                                      fontSize: 20.sp,
                                      color: AppColors.Orange,
                                    ),
                                    text: LocaleKeys.Arabic.tr(),
                                    onPressed: () {
                                      context.setLocale(const Locale('ar'));
                                    },
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                  ),
                   SizedBox(
                    height: 10.h,
                  ),
                  MaterialButtonCusttom(
                    onPressed: () {
                      SharedHelper.clear();
                      Navigation.pushAndremove(context, const LoginScreen());
                    },
                    text: LocaleKeys.LogOut.tr(),
                    color: AppColors.wihte2,
                    textcolor: AppColors.green,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
