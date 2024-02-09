import 'package:flutter/material.dart';
import 'package:todo_app/view/screens/sign_in/sign_in_screen.dart';
import 'package:todo_app/view_model/uitils/colors.dart';
import '../../../view_model/uitils/icons.dart';
import '../../../view_model/uitils/images.dart';
import '../../../view_model/uitils/navigation.dart';
import '../../components/circle_image_custom.dart';
import '../../components/elvetaed_bottun_custom.dart';
import '../../components/text-button_custom.dart';
import '../../components/text_custom.dart';
import '../dashbord/dashboard_screen.dart';
import 'components/dialog_component.dart';

class AddTskScreen extends StatelessWidget {
  const AddTskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleImageCustom(
                onPressed: () {
                  Navigation.push(context, SginInScreen());
                },
              ),
              TextCustom(
                text: 'Welcome Onboard!',
                fontWeight: FontWeight.w800,
                size: 22,
              ),
              SizedBox(
                height: 40,
              ),
              Image.asset(AppImages.GirlAndBoy!),
              SizedBox(
                height: 50,
              ),
              Expanded(
                child: TextCustom(
                  text: 'Add What your want to do later on..',
                  color: AppColors.green,
                ),
              ),
              ElevatedButtonCustom(
                height: 50,
                width: 200,
                text: "Add Task",
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return DialogCustom();
                    },
                  );
                },
              ),
              SizedBox(
                height: 50,
              ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButtonCustom(
                onPressed: () {
                  Navigation.push(context, DashboardScreen());
                },
                text: "Dashboard ",
                textColor: AppColors.green,
              ),
                 AppIcon.arrowLRight,
            ],
          ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
