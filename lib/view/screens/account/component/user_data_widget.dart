import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/view_model/data/local/shared_helper.dart';
import 'package:graduation_project/view_model/data/local/shared_keyes.dart';
import 'package:graduation_project/view_model/uitils/Colors.dart';
import 'package:graduation_project/view_model/uitils/images.dart';
import '../../../../../view_model/uitils/Text_custom.dart';
import '../../../../../view_model/uitils/icons.dart';


class UserDataWidget extends StatelessWidget {
  const UserDataWidget({ super.key});

  @override
  Widget build(BuildContext context) {
    var userNmae =SharedHelper.get(key: SharedKeys.userName)??'';
    var userEmail =SharedHelper.get(key: SharedKeys.userEmail)??'';
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Image.asset(AppImages.userImage),
         SizedBox(width: 20.w),
        Column(
          children: [
            TextCustom(
            text: '$userNmae',
              fontSize: 20.sp,
              color: AppColors.black,
            ),
            TextCustom(
            text: "$userEmail",
              fontSize: 15.sp,
              color: AppColors.gray,
            ),
          ],
        ),
        IconButton(
          onPressed: () {

          },
            icon: AppIcons.edit),
      ],
    );
  }
}
