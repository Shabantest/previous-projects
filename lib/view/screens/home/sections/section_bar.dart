import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../view_model/uitils/images.dart';

class SectionBAr extends StatelessWidget {
  const SectionBAr({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 5,),
        Image.asset(
          AppImages.carrot,
          height: 50,
          width: 50,
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
