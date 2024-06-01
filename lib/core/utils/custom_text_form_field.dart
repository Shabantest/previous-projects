import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({super.key, this.hintText,this.controller,this.validator,this.autovalidateMode});
 final String? Function(String?)? validator;
 final AutovalidateMode? autovalidateMode;
   final TextEditingController? controller;
  final String? hintText;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Material(
        elevation: 3,
        shadowColor: Colors.grey,
        borderRadius: BorderRadius.circular(30),
        child: TextFormField(
          autovalidateMode: autovalidateMode,
          validator:validator ,
    controller:controller ,
          decoration: InputDecoration(
            hintText: hintText,
            fillColor: Colors.white,
            filled: true,
            enabledBorder: buildOutlineInputBorder(),
            focusedBorder: buildOutlineInputBorder(),
            disabledBorder: buildOutlineInputBorder(),
            border: buildOutlineInputBorder(),
          ),
        ),
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(

      borderRadius: BorderRadius.circular(30),
      borderSide: const BorderSide(
        color: Colors.grey,
        width: 1,
      ),
    );
  }
}
