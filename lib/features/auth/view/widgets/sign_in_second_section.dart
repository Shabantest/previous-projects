import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/utils/custom_button.dart';
import '../sign_up_view.dart';

class SignInSecondSection extends StatelessWidget {
  const SignInSecondSection({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        const Text(
          textAlign: TextAlign.center,
          'if you forget your password',
          style: TextStyle(
            color: AppColors.primary,
            fontSize: 21,
            fontWeight: FontWeight.w600,
          ),
        ),
        const CustomButton(text: 'Forget Password'),
        const SizedBox(
          height: 40,
        ),
        const Text(
          textAlign: TextAlign.center,
          'if you don’t an account you can',
          style: TextStyle(
            color: AppColors.primary,
            fontSize: 21,
            fontWeight: FontWeight.w600,
          ),
        ),
        CustomButton(text: ' Register here!',onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const SignUpView(),));
        },),
      ],
    );
  }
}
