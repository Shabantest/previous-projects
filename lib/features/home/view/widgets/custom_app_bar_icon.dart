import 'package:flutter/material.dart';

class CustomAppBarIcon extends StatelessWidget {
  const CustomAppBarIcon({super.key, required this.iconData,this.onTap});
 final void Function()? onTap;
  final IconData iconData;
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap:onTap,
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration:  BoxDecoration(
            border: Border.all(color: Colors.grey),
            shape: BoxShape.circle

        ),
        child:  Center(
          child: Icon(
            iconData,
            size: 30,
          ),
        ),
      ),
    );
  }
}
