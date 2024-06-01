import 'package:flutter/material.dart';
import 'package:trip_planner360/features/auth/view/widgets/sign_in_frist_section.dart';
import 'package:trip_planner360/features/auth/view/widgets/sign_in_second_section.dart';


class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
        body: Padding(
      padding: EdgeInsets.all(16),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SignInFristSection(),
            SizedBox(height: 50,),
            SignInSecondSection(),
          ],
        ),
      ),
    ));
  }
}
