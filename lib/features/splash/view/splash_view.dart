import 'package:flutter/material.dart';
import '../../../core/constants/app_images.dart';
import '../../../core/utils/custom_button.dart';
import '../../auth/view/sign_in_view.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const SizedBox(
            height: 50,
          ),
          Image.asset(AppImages.splash),
          CustomButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>  const SignInView(),
                ),
              );
            },
            text: 'Login',
          ),
          const SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}
