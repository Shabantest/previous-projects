
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../view_model/uitils/Colors.dart';
import '../../../../../view_model/uitils/Text_custom.dart';
import '../../../../model/product_model/product_model.dart';

class ExploreProductWidget extends StatelessWidget {
  final ProductModel product;
  void Function()? onPressed;
  void Function()? onTap;
   ExploreProductWidget({required this.product,this.onPressed,this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children:[ Container(
            height: 350.h,
            width: 200.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadiusDirectional.circular(18.r),
              border:   Border.all(color: AppColors.orange, width: 1.w,
              ),
              color: const Color.fromRGBO(83, 177, 117, 0.1),
            ),
            child: Padding(
              padding:  EdgeInsets.all(3.w),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                 crossAxisAlignment: CrossAxisAlignment.start,
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       Image.network(product.image ?? '',width: 80.w,height: 70.h,fit: BoxFit.cover,),
                       TextCustom(
                         text: "  ${product.price?? 0}" ,
                         fontSize: 15.sp,
                         color: AppColors.green,
                         textAlign: TextAlign.end,
                       ),
                     ],
                   ),
                   TextCustom(
                     text: product.name ?? '',
                     fontSize: 17.sp,
                     color: AppColors.black,
                     textAlign: TextAlign.start,
                   ),
                   IconButton(
                     onPressed: onPressed,
                       icon: const Icon(Icons.shopping_cart,color: AppColors.Orange,size: 25,),
                   ),
                 ],
               ),
            ),
        // ),
      ),
        IconButton(
            onPressed: onTap,
            icon: const Icon(
              Icons.favorite_outlined,
              color: AppColors.gray,
            )),
    ]
    );
  }
}
