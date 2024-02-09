import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../view_model/uitils/colors.dart';
import '../../../components/text_form_field_custom.dart';

class TextFormFieldsSection extends StatelessWidget {
  const TextFormFieldsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return       Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          TextFormFieldCustom(
            focusedBorder:      OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color:AppColors.green),
            ),
            borderColor: AppColors.green,
            hintText: "Name",
            label: "Enter your full Name",
            textColor: Colors.black,
            labelStyleColor: Colors.black,
          ),
          SizedBox(
            height: 15,
          ),
          TextFormFieldCustom(
            focusedBorder:    OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color:AppColors.green),
            ),
            borderColor: AppColors.green,
            hintText: "Email",
            label: "Enter your Email address ",
            textColor: Colors.black,
            labelStyleColor: Colors.black,
          ),
          SizedBox(
            height: 15,
          ),
          TextFormFieldCustom(
            focusedBorder:  OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color:AppColors.green),
            ),
            obscure: true,
            borderColor: AppColors.green,
            hintText: "Password",
            label: "Create a Password",
            textColor: Colors.black,
            labelStyleColor: Colors.black,
          ),
          SizedBox(
            height: 15,
          ),
          TextFormFieldCustom(
            focusedBorder:  OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color:AppColors.green),
            ),
            obscure: true,
            borderColor: AppColors.green,
            label: "Confirm your Password",
            textColor: Colors.black,
            labelStyleColor: Colors.black,
          ),
        ],
      ),
    );
  }
}
