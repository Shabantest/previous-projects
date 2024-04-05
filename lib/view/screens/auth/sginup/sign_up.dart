import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../../i10/local_keys.g.dart';
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
import '../loging/login_screen.dart';
class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.deepGreen,
      body: SafeArea(
        child: ListView(
          padding:  EdgeInsetsDirectional.all(20.w),
          children: [
            BlocBuilder<UserCubit, UserStates>(
              builder: (context, state) {
                var cubit = UserCubit.get(context);
                return Form(
                  key:cubit.singFormKey,
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
                          text: LocaleKeys.SignUp.tr(),
                          fontWeight: FontWeight.w600,
                          fontSize: 26.sp,
                          color: AppColors.Orange,
                        ),
                         SizedBox(
                          height: 10.h,
                        ),
                        TextCustom(
                          text:LocaleKeys.EnterYourCredentialsToContinue.tr(),
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w200,
                        ),
                        TextFormUserName(
                          controller: cubit.signUserNameController,
                          label:LocaleKeys.Username.tr(),
                          hintText:LocaleKeys.EnterYourName.tr(),
                        ),
                         SizedBox(
                          height: 20.h,
                        ),
                        TextFormField(
                            controller: cubit.phoneNumberController,
                            decoration:  InputDecoration(
                                disabledBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: AppColors.green,
                                    )),
                                focusedBorder:  UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: AppColors.Orange,
                                    width: 2.w,
                                  ),
                                ),
                                hintText: "20+",
                                hintStyle: const TextStyle(
                                  color: AppColors.green,
                                ),
                                labelText: LocaleKeys.PhoneNumber.tr(),
                                labelStyle: const TextStyle(
                                  color: AppColors.Orange,
                                )),
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            validator: (value) {
                              if ((value ?? '').isEmpty) {
                                return LocaleKeys.pleaseEnterYourPhoneNumber.tr();
                              }
                            }),
                         SizedBox(
                          height: 20.h,
                        ),
                        TextFormFiledEmail(
                            controller: cubit.signEmailController,
                            hintTxt:LocaleKeys.EnterYourEmail.tr(),
                            label: LocaleKeys.Email.tr()),
                         SizedBox(
                          height: 20.h,
                        ),

                        TextFormField(
                          controller: cubit.signPasswordController,
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
                            hintStyle: const TextStyle(
                              color: AppColors.green,
                            ),
                            hintText:  LocaleKeys.EnterYourPassword.tr(),
                            label:  Text(LocaleKeys.password.tr()),
                            suffixIcon: IconButton(
                              onPressed: () {
                                cubit.checkPass();
                              },
                              icon: cubit.obscure ? AppIcons.visibility : AppIcons.visibilitt_off,
                              color: cubit.obscure ? AppColors.Orange : AppColors.red,
                            ),
                          ),
                          obscureText: cubit.obscure,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if ((value ?? '').isEmpty) {
                              return LocaleKeys.pleaseEnterYourPassword.tr();
                            } else if ((value?.length ?? 0) < 8) {
                              return LocaleKeys.passwordCantToBeLessThan8characters.tr();
                            } else if (!RegExp(r'[A-Z]').hasMatch(value ?? '')) {
                              return LocaleKeys.PasswordMustContainAtLeastOneCapitalLetter.tr();
                            } else if (!RegExp(r'[0-9]').hasMatch(value ?? '')) {
                              return LocaleKeys.PasswordMustContainAtLeastOneNumbers.tr();
                            } else if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value ?? '')) {
                              return LocaleKeys.PasswordMustContainAtLeastOneNumbers.tr();
                            }
                            return null;
                          },
                        ),
                         SizedBox(
                          height: 20.h,
                        ),
                         Text(
                            LocaleKeys.ByContinuingYouAgreeToOurTermsOfServiceAndPrivacy.tr()),
                         SizedBox(
                          height: 50.h,
                        ),
                        MaterialButtonCusttom(
                          color: AppColors.Orange,
                          textcolor: AppColors.white,
                          text:LocaleKeys.SingIn.tr(),
                          onPressed: () {
                            if (cubit.singFormKey.currentState!.validate()) {
                              cubit.signUseFirebase().then((value) => {
                              Fluttertoast.showToast(
                              msg: "SignUp Success ",
                              backgroundColor:AppColors.Orange,
                              fontSize: 15,
                              toastLength: Toast.LENGTH_SHORT,
                              textColor: AppColors.white),
                              });
                              if(state is UserSignSuccessSate){
                                Navigation.push(context, const LoginScreen());
                              }
                            }
                          },
                        ),
                      ]),
                );
              },
            ),
             SizedBox(
              height: 10.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                 Text(LocaleKeys.AlreadyHaveAnAccount.tr()),
                TextButtonCustom(
                  style: const TextStyle(color: AppColors.Orange ),
                  text:LocaleKeys.SingIn.tr(),
                  onPressed: () {
                    Navigation.push(context, const LoginScreen());
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
