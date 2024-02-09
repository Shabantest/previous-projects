import 'package:flutter/material.dart';
import 'package:todo_app/view/components/text_custom.dart';
import 'package:todo_app/view/screens/home/home_screen.dart';
import 'package:todo_app/view/screens/sign_up/sections/text_form_fields_section.dart';
import '../../../view_model/uitils/colors.dart';
import '../../../view_model/uitils/icons.dart';
import '../../../view_model/uitils/navigation.dart';
import '../../components/circle_image_custom.dart';
import '../../components/elvetaed_bottun_custom.dart';
import '../../components/text-button_custom.dart';
import '../sign_in/sign_in_screen.dart';
class SginUpScreen extends StatelessWidget {
  const SginUpScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Center(
          child: ListView(
            children:[ Column(
              children: [
                CircleImageCustom(
                  onPressed: () {
                    Navigation.push(context,HomeScreen());
                  },
                ),
                TextCustom(
                  text: "Welcome Onboard!",
                  fontWeight: FontWeight.w500,
                  size: 22,
                ),
                SizedBox(
                  height: 40,
                ),
                TextCustom(
                  text: "Let’s help you meet up your task",
                  fontWeight: FontWeight.w400,
                  color: AppColors.green,
                ),
                SizedBox(
                  height: 50,
                ),
                TextFormFieldsSection(),
                SizedBox(height: 100,),
                ElevatedButtonCustom(
                  height: 50,
                  width: 200,
                  text: "Sign Up",
                  onPressed: () {
                    Navigation.push(context,SginInScreen(),);
                  },
                ),
                SizedBox(height:10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextCustom(text: "Already have an account ? ",),
                    TextButtonCustom(
                      text: "Sgin In",
                      onPressed: () {
                        Navigation.push(context, SginInScreen());
                      },
                      textColor: AppColors.green,
                    ),
                  ],
                ),
              ],
            ),
      ]
          ),
        ),
      ),
    );
  }
}
