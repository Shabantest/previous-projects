import 'package:flutter/material.dart';
import '../../../../core/utils/text_styles.dart';

class CustomCategoryHotelItem extends StatelessWidget {
  const CustomCategoryHotelItem(
      {super.key,
        this.name,
        required this.image,
        this.onTap, this.height,
      });

  final String? name;
  final String image;
  final void Function()? onTap;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 3,
      shadowColor: Colors.grey,
      borderRadius: BorderRadius.circular(30),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: Colors.black),
          ),
          child: Column(
            children: [
              ClipRRect(
                borderRadius:  BorderRadius.only(
                  topLeft: const Radius.circular(30),
                  topRight: const Radius.circular(30),
                  bottomLeft: name == null ? const Radius.circular(30) :const Radius.circular(0),
                  bottomRight:  name == null ? const Radius.circular(30) :const Radius.circular(0),

                ),
                child: AspectRatio(
                  aspectRatio: 2.8,
                  child: Image.asset(
                    image,
                    height: height,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              name != null
                  ? Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  name!,
                  style: AppStyles.style18
                      .copyWith(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              )
                  : const SizedBox.shrink()
            ],
          ),
        ),
      ),
    );
  }
}
