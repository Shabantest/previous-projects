import 'package:flutter/material.dart';
import 'package:todo_app/view/components/circle_image_custom.dart';
import 'package:todo_app/view/components/elvetaed_bottun_custom.dart';
import 'package:todo_app/view/components/text_form_field_custom.dart';
import 'package:todo_app/view/screens/sign_up/sgin_up_screen.dart';
import '../../../view_model/uitils/colors.dart';
import '../../../view_model/uitils/images.dart';
import '../../../view_model/uitils/navigation.dart';
import '../../components/text-button_custom.dart';
import '../../components/text_custom.dart';
import '../add_task/add_task_screen.dart';
class SginInScreen extends StatelessWidget {
  const SginInScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: SafeArea(
            child: Center(
              child: ListView(
                children:[ Column(
                  children: [
                    CircleImageCustom(
                      onPressed: () {
                        Navigation.push(context,SginUpScreen());
                      },
                    ),
                    TextCustom(
                      text: "Welcome Back!",
                      size: 22,
                      fontWeight: FontWeight.w500,
                    ),
                    SizedBox(height: 40,),
                    Image.asset(AppImages.manExplanining!),
                    SizedBox(height: 40,),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          TextFormFieldCustom(
                            focusedBorder:  OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(color:AppColors.green),
                            ),
                            label: "Enter your Email address ",
                            labelStyleColor: Colors.black,
                            hintText: "Email",
                            textColor: Colors.black,
                            borderColor: AppColors.green,
                          ),
                          SizedBox(height: 20,),
                          TextFormFieldCustom(
                            focusedBorder:  OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(color:AppColors.green),
                            ),
                            obscure: true,
                            label: "Enter your Password ",
                            labelStyleColor: Colors.black,
                            hintText: "Password",
                            textColor:Colors.black,
                            borderColor: AppColors.green,
                          ),
                        ],
                      ),
                    ),
                    TextButtonCustom(
                      onPressed: () {

                      },
                      text: "Forgot Password ?",
                      textColor: AppColors.green,
                    ),
                    ElevatedButtonCustom(
                      height: 50,
                      width: 200,
                      onPressed: () {
                    Navigation.push(context, AddTskScreen());
                      },
                      text: "Sgin In",
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      TextCustom(text: 'Dont have an account ? ',),
                      TextButtonCustom(
                        text: 'Sign Up',
                        textColor: AppColors.green,
                        onPressed: () {
                          Navigation.push(context, SginUpScreen(),);
                        },
                      )
                    ],)
                  ],
                ),
      ]
              ),
            ),
          ),
    );
  }
}
