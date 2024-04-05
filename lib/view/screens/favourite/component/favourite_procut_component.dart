import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../model/product_model/product_model.dart';
import '../../../../view_model/uitils/Colors.dart';
import '../../../../view_model/uitils/Text_custom.dart';
class FavouriteProductCustom extends StatelessWidget {
  final ProductModel product;
  void Function()? onPressed;
  void Function()? onTap;
   FavouriteProductCustom({required this.product,this.onTap,this.onPressed, super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.deepGreen,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Image.network(product.image??'',width: 70.w,height: 60.h,),
              Expanded(
                child: Column(
                  children: [
                    TextCustom(
                      text: product.title??'',
                      fontSize: 18.sp,
                      color: AppColors.gray,
                    ),
                    TextCustom(
                      text: product.name??'',
                      fontSize: 20.sp,
                      color: AppColors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextCustom(
                    text: "  ${product.price?? 0}" ,
                    fontSize: 20.sp,
                    color: AppColors.green,
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed:onPressed,
                        icon: const Icon(Icons.add_shopping_cart,color: AppColors.Orange,size: 25,),
                      ),
                      IconButton(
                        onPressed:onTap,
                        icon: const Icon(Icons.delete,color: AppColors.red,size: 20,),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
           Divider(
            color: AppColors.gray,
            height: 1.h,
          ),
        ],
      ),
    );

  }
}
