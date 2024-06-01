import 'package:flutter/material.dart';

import '../../../../core/constants/app_images.dart';

class CustomCategoriesAppBar extends StatelessWidget {
  const CustomCategoriesAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 50),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              width: 10,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Image.asset(AppImages.arrowBack),
            ),
          ],
        ),
      ],
    );
  }
}
