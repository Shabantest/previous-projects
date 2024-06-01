import 'package:flutter/material.dart';
import 'package:trip_planner360/core/utils/CustomNavigator.dart';
import 'package:trip_planner360/features/home/view/home_view.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_images.dart';
import '../../../../core/utils/custom_button.dart';


class SuccessSignView extends StatelessWidget {
  const SuccessSignView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AppImages.correctCheck),
            const SizedBox(height: 20,),

            const Text('Your Sign up was successful',style: TextStyle(color: AppColors.primary,fontWeight: FontWeight.bold,fontSize: 22),),
            const SizedBox(height: 20,),
            CustomButton(text: 'Continue to Home',
            onPressed: (){
              CustomNavigator.pushAndRemoveUtil(context, const HomeView());
            },),
          ],
        ),
      ),
    );
  }
}
