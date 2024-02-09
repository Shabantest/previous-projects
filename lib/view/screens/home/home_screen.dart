import 'package:flutter/material.dart';
import 'package:todo_app/view/components/elvetaed_bottun_custom.dart';
import 'package:todo_app/view_model/uitils/images.dart';
import '../../../view_model/uitils/navigation.dart';
import '../../components/circle_image_custom.dart';
import '../../components/text_custom.dart';
import '../sign_up/sgin_up_screen.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              CircleImageCustom(),
              SizedBox(
                height: 60,
              ),
              Image.asset(AppImages.manStting ?? ''),
              SizedBox(
                height: 60,
              ),
              TextCustom(
                text: "Get things done with TODo",
                size: 20,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(
                height: 30,
              ),
              TextCustom(
                text: "Lorem ipsum dolor sit amet",
              ),
              TextCustom(
                text: " consectetur adipisicing. Maxime",
              ),
              TextCustom(
                text: "  tempore! Animi nemo aut atque",
              ),
              TextCustom(
                text: "  deleniti nihil dolorem repellendus.",
              ),
              SizedBox(
                height: 100,
              ),
              ElevatedButtonCustom(
                height: 50,
                width: 200,
                onPressed: () {
                Navigation.push(context, SginUpScreen());
                },
                text: 'Get Started',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
