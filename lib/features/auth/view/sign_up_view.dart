import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:trip_planner360/features/auth/view/sign_in_view.dart';
import 'package:trip_planner360/features/auth/view/widgets/sign_up_form_section.dart';
import 'package:trip_planner360/features/auth/view/widgets/success_sign_view.dart';
import 'package:trip_planner360/features/auth/view_model/user_cubit.dart';


import '../../../core/constants/app_colors.dart';
import '../../../core/utils/custom_button.dart';
import '../view_model/user_states.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Text(
                'Welcome',
                style: TextStyle(
                    color: AppColors.primary,
                    fontSize: 28,
                    fontWeight: FontWeight.w600),
              ),
              Text(
                'Sign up for the Chunky app',
                style: TextStyle(
                  color: AppColors.primary,
                  fontSize: 22,
                ),
              ),
              SizedBox(
                height: 30,
              ),
             SignUpFormSection(),
              Row(
                children: [
                  Checkbox(
                    fillColor:MaterialStatePropertyAll(AppColors.primary) ,
                    value: true,
                    onChanged: (value) {},
                  ),
                  Expanded(
                    child: Text(
                      'By clicking on ‘sign up’, you’re agreeing to the Chunky app Terms of Service and Privacy Policy',
                    style: TextStyle(color: AppColors.primary),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10,),
         BlocConsumer<UserCubit,UserStates>(
           listener: (context, state) {
             if(state is UserSignSuccessState){
               Navigator.push(context,  MaterialPageRoute(builder: (context) =>  const SignInView(),));
               Fluttertoast.showToast(msg: "Sign success",
                 toastLength: Toast.LENGTH_LONG,
                 textColor: AppColors.white,
                 fontSize: 18,
                 backgroundColor: AppColors.primary,
               );
             }
           },
           builder: (context, state) {
          var cubit =UserCubit.get(context);
           return  CustomButton(text: 'Sign Up',onPressed: () {
             if (cubit.formKey.currentState!.validate()) {
               cubit.signUserFirebase();
             }
           },);
         },),
            ],
          ),
        ),
      ),
    );
  }
}

