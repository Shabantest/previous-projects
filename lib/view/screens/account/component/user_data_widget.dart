import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/view_model/data/local/shared_keyes.dart';
import 'package:graduation_project/view_model/uitils/Colors.dart';
import '../../../../../view_model/uitils/Text_custom.dart';
import '../../../../../view_model/uitils/icons.dart';
import '../../../../view_model/data/local/shared_helper.dart';


class UserDataWidget extends StatelessWidget  {
   UserDataWidget({  super.key});

  @override
  Widget build(BuildContext context) {
    var name=SharedHelper.get(key: SharedKeys.userName);
    var email=SharedHelper.get(key: SharedKeys.userEmail);
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
         const CircleAvatar(
           backgroundColor: AppColors.black,
           radius: 28,
          child: Icon(Icons.person,size: 40,color: AppColors.Orange,),
        ),
         SizedBox(width: 15.w),
        Column(
          children: [
            TextCustom(
            text: name,
              fontSize: 20.sp,
              color: AppColors.black,
            ),
            TextCustom(
            text: email,
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
