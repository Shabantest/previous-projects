
import 'package:flutter/material.dart';
import '../../view_model/uitils/icons.dart';
import '../../view_model/uitils/images.dart';
class CircleImageCustom extends StatelessWidget {
  Function()? onPressed;
   CircleImageCustom({ this.onPressed ,super.key});

  @override
  Widget build(BuildContext context) {
    return     Stack(
      children:[ Row(
        children: [
          Image.asset(
            AppImages.circleDesign ?? '',
            height: 100,
            fit: BoxFit.cover,
          ),
        ],
      ),
        Align(
            alignment: Alignment.topLeft,
            child: IconButton(
              onPressed: onPressed,
              icon: AppIcon.arrowLift,
            )),
    ]
    );
  }
}
