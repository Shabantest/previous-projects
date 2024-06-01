import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class CustomButton extends StatelessWidget {

  const CustomButton({super.key, this.onPressed, required this.text});

  final void Function()? onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style:  const ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(Colors.white),
          side: MaterialStatePropertyAll(BorderSide(color: Colors.black87)),
          fixedSize: MaterialStatePropertyAll(
            Size(200, 30),
          ),
          shadowColor: MaterialStatePropertyAll(Colors.black),
          elevation: MaterialStatePropertyAll(8)
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: const TextStyle(color: AppColors.primary),
      ),
    );
  }
}
