import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/view_model/cubit/cart_cubit/product_mange_cubit.dart';
import 'package:graduation_project/view_model/uitils/Colors.dart';
import '../../../../../view_model/uitils/Text_custom.dart';
import '../../../../model/product_model/product_model.dart';

class CartProductWidget extends StatefulWidget {
  final ProductModel cartProduct;
  void Function()? onPressed;
   CartProductWidget({required this.cartProduct,this.onPressed, super.key});

  @override
  State<CartProductWidget> createState() => _CartProductWidgetState();
}

class _CartProductWidgetState extends State<CartProductWidget> {
  int number = 1;
  @override
  Widget build(BuildContext context) {
    var cubit=ProductMangeCubit.get(context);
    return Container(
      margin:  EdgeInsetsDirectional.all(5.w),
      padding:  EdgeInsets.all(10.w),
      decoration: BoxDecoration(
        color:  const Color.fromRGBO(237, 247, 236,1),
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(width: 1.w,color: Colors.orange),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.network(
                widget.cartProduct.image ?? '', width: 100.w, height: 100.h,),
               SizedBox(width: 30.w,),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextCustom(
                    text: "${widget.cartProduct.name ?? ''}\n",
                    fontSize: 17.sp,
                    color: AppColors.black,
                    fontWeight: FontWeight.bold,
                    textAlign: TextAlign.center,
                  ),
                  TextCustom(
                    text: widget.cartProduct.title ?? '',
                    fontSize: 17.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.gray,
                  ),
                ],
              ),
            ],
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  onPressed:widget.onPressed,
                  icon: const Icon(Icons.delete,color: AppColors.red,),
                ),
                MaterialButton(
                  color: AppColors.green,
                  highlightColor: AppColors.Orange,
                  height: 10.h,
                  shape: const CircleBorder(
                      side: BorderSide(color: AppColors.gray)
                  ),
                  onPressed: () {
                    if (cubit.productCounter > 1) {
                      setState(() {
                        cubit.productCounter--;
                      });
                    }
                  },
                  child: const Icon(Icons.remove,color: AppColors.white,),
                ),
                TextCustom(
                  text: "${cubit.productCounter}",
                  fontSize: 15.sp,
                  color: AppColors.gray2,
                ),
                MaterialButton(
                  color: AppColors.green,
                  highlightColor: AppColors.Orange,
                  height: 10.h,
                  shape: const CircleBorder(
                    side: BorderSide(color: AppColors.gray,),
                  ),
                  onPressed: () {
                    setState(() {
                      cubit.productCounter++;
                    });
                  },
                  child: const Icon(Icons.add,color: AppColors.white,),
                ),
                TextCustom(
                  text: "  ${widget.cartProduct.price?? 0}" ,
                  fontSize: 18.sp,
                  color: AppColors.green,
                  fontWeight: FontWeight.bold,
                ),
              ]
          ),
        ],
      ),
    );
  }
}
