import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/i10/local_keys.g.dart';
import 'package:graduation_project/view/componants/bottom_navigaton_bar.dart';
import '../../../../view_model/cubit/user_cubit/user_cubit.dart';
import '../../../../view_model/cubit/user_cubit/user_state.dart';
import '../../../../view_model/uitils/Colors.dart';
import '../../../../view_model/uitils/Text_custom.dart';
import '../../../../view_model/uitils/icons.dart';
import '../../../../view_model/uitils/images.dart';
import '../../../../view_model/uitils/navigation.dart';
import '../../../componants/material_Button.dart';
import '../../../componants/text_button.dart';
import '../../../componants/textformfield.dart';
import '../sginup/sign_up.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.deepGreen,
      body: SafeArea(
        child: ListView(children: [
          Padding(
            padding:  EdgeInsets.all(20.w),
            child: BlocBuilder<UserCubit,UserStates>(
              builder: (context, state) {
                var cubit = UserCubit.get(context);
                return Form(
                  key: cubit.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                       SizedBox(
                        height: 50.h,
                      ),
                      Center(child: Image.asset(AppImages.carrot)),
                       SizedBox(
                        height: 50.h,
                      ),
                       TextCustom(
                        text: LocaleKeys.Login.tr(),
                          fontWeight: FontWeight.w600, fontSize: 26.sp, color: AppColors.Orange,
                      ),
                       SizedBox(
                        height: 10.h,
                      ),
                       TextCustom(
                     text:   LocaleKeys.EnterYourEmailAndPassword.tr(),
                           fontSize: 18.sp, fontWeight: FontWeight.w200,
                      ),
                       SizedBox(
                        height: 30.h,
                      ),
                      TextFormFiledEmail(
                        controller: cubit.loginEmailController,
                          hintTxt: LocaleKeys.EnterYourEmail.tr(), label: LocaleKeys.Email.tr(),),
                       SizedBox(
                        height: 30.h,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          focusedBorder:   UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: AppColors.Orange,
                              width: 2.w,
                            ),
                          ),
                          labelStyle: const TextStyle(
                            color: AppColors.Orange,
                          ),
                          hintText:  LocaleKeys.EnterYourPassword.tr(),
                          label:  Text (LocaleKeys.password.tr(),),
                          suffixIcon: IconButton(
                            onPressed: () {
                              cubit.checkPass();
                            },
                            icon: cubit.obscure ? AppIcons.visibility : AppIcons.visibilitt_off,
                            color: cubit.obscure ? AppColors.Orange : AppColors.red,
                          ),
                        ),
                        controller: cubit.loginPasswordController,
                        obscureText: cubit.obscure,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if ((value ?? '').isEmpty) {
                            return  LocaleKeys.pleaseEnterYourPassword.tr();
                          } else if ((value?.length ?? 0) < 8) {
                            return LocaleKeys.passwordCantToBeLessThan8characters.tr();
                          } else if (!RegExp(r'[A-Z]').hasMatch(value ?? '')) {
                            return LocaleKeys.PasswordMustContainAtLeastOneCapitalLetter.tr();
                          } else if (!RegExp(r'[0-9]').hasMatch(value ?? '')) {
                            return LocaleKeys.PasswordMustContainAtLeastOneNumbers.tr();
                          } else if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value ?? '')) {
                            return  LocaleKeys.PasswordMustContainAtLeastOneNumbers.tr();
                          }
                          return null;
                        },
                      ),
                       SizedBox(
                        height: 10.h,
                      ),
                       Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            LocaleKeys.ForgotPassword.tr(),
                            style:  TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 12.sp,
                              color: AppColors.black,
                            ),
                          ),
                        ],
                      ),
                       SizedBox(
                        height: 30.h,
                      ),
                      MaterialButtonCusttom(
                          color: AppColors.Orange,
                          textcolor: AppColors.white,
                          text:LocaleKeys.Login.tr(),
                          onPressed: () {
                            if (cubit.formKey.currentState!.validate()) {
                              cubit.loginUserFirebase();
                              if(state is UserLoginSuccessState){
                                Navigation.pushAndremove(context, const BottomNavigationCustom());
                              }
                            }
                          }),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                           Text(LocaleKeys.DontHaveAnAccount.tr()),
                          TextButtonCustom(
                              style:   const TextStyle(color: AppColors.Orange ),
                              text: LocaleKeys.SignUp.tr(),
                              onPressed: () {
                                Navigation.pushAndremove(context, const SignUpScreen());
                              }),
                        ],
                      ),
                    ],
                  ),
                );
              },
            )
          ),
        ]),
      ),
    );
  }
}
