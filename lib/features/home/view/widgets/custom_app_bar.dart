import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/utils/CustomNavigator.dart';
import '../../../splash/view/splash_view.dart';
import 'custom_app_bar_icon.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return   Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const CustomAppBarIcon(iconData:   Icons.notifications_none_outlined),
        const Row(
          children: [
            Icon(
              Icons.location_on_sharp,
              color: AppColors.primary,
            ),
            Text(
              'Shraqia',
              style: TextStyle(
                color: AppColors.primary,
              ),
            )
          ],
        ),

        CustomAppBarIcon(iconData: Icons.logout,onTap:  () {
          CustomNavigator.pushAndRemoveUtil(context,  const SplashView());
        },),
      ],
    );
  }
}
