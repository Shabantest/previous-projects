import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:trip_planner360/features/auth/view/widgets/success_sign_view.dart';
import 'package:trip_planner360/features/auth/view_model/user_cubit.dart';
import 'package:trip_planner360/features/auth/view_model/user_states.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/utils/custom_button.dart';
import '../../../../core/utils/custom_text_form_field.dart';

class SignInFristSection extends StatelessWidget {
  const SignInFristSection({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<UserCubit,UserStates>(
      listener: (context, state) {
        if(state is UserLoginSuccessState){
          Navigator.push(context,  MaterialPageRoute(builder: (context) => const SuccessSignView(),));
          Fluttertoast.showToast(msg: "Login success",
            toastLength: Toast.LENGTH_LONG,
            textColor: AppColors.white,
            fontSize: 18,
            backgroundColor: AppColors.primary,
          );
        }
      },
      builder: (context, state) {
        var cubit =UserCubit.get(context);
        return  Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Engish',
                  style: TextStyle(color: AppColors.primary, fontSize: 17),
                ),
              ],
            ),
            SizedBox(
              height: 80,
            ),
            Text(
              'Sign In to recharge Direct',
              style: TextStyle(
                  color: AppColors.primary,
                  fontSize: 28,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 50,
            ),
            CustomTextFormField(hintText: 'Email/phone number ',
              controller: cubit.emailLoginController,
            ),
            SizedBox(
              height: 15,
            ),
            CustomTextFormField(hintText: 'Password',
              controller: cubit.passwordLoginController,),
            SizedBox(
              height: 25,
            ),
            CustomButton(text: 'Sign IN',
           onPressed: (){
              cubit.loginFirebase();
           }, ),
          ],
        );
      },
    );
  }
}
