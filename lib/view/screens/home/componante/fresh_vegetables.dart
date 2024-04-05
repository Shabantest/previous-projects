import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../view_model/uitils/images.dart';

class Vegetables extends StatelessWidget {
  const Vegetables({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
        height: 120.h,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => Image.asset(AppImages.vegetables),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          itemCount: 2,
        ));
  }
}
