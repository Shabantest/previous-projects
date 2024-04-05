import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../i10/local_keys.g.dart';
import '../../view_model/uitils/Colors.dart';

class TextFormFiledEmail extends StatelessWidget {
  String hintTxt, label;
  TextEditingController? controller;
  TextFormFiledEmail(
      {required this.hintTxt, this.controller, required this.label, super.key});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: controller,
        decoration: InputDecoration(
          focusedBorder:   UnderlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.Orange,
              width: 2.w,
            ),
          ),
          hintStyle: const TextStyle(
            color: AppColors.green,
          ),
          hintText: hintTxt,
          labelText: label,
          labelStyle: const TextStyle(
            color: AppColors.Orange,
          )
        ),
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (value) {
          if ((value ?? '').isEmpty) {
            return LocaleKeys.EnterYourEmail.tr();
          }
        });
  }
}

class TextFormUserName extends StatelessWidget {
  String hintText, label;
  TextEditingController? controller;
  TextFormUserName({required this.hintText,this.controller, required this.label, super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller:controller ,
      decoration: InputDecoration(
        focusedBorder:  const UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.Orange,
            width: 2,
          ),
        ),
        labelStyle: const TextStyle(
          color: AppColors.Orange,
        ),
        hintStyle: const TextStyle(
          color: AppColors.green,
        ),
        hintText: hintText,
        labelText: label,
      ),
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (value) {
          if ((value ?? '').isEmpty) {
         return LocaleKeys.EnterYourName.tr();
          }
        }
    );
  }
}
