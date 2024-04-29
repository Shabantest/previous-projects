import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/view_model/cubit/produt_cubit/product_states.dart';
import '../../../../../view_model/uitils/Colors.dart';
import '../../../../../view_model/uitils/Text_custom.dart';
import '../../../../model/product_model/product_model.dart';
import '../../../../view_model/cubit/produt_cubit/product_cubit.dart';
import '../../../componants/floating_action_button.dart';

class ProductWidget extends StatelessWidget {
  final ProductModel product;
  void Function()? onPressed;
  void Function()? onTap;
  double? width;
  double? height;
  double? imageWidth;
  double? imageHeight;

  ProductWidget(
      {required this.product,this.imageHeight, this.onTap, this.imageWidth, this.width = 180, this.height = 300, this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductStates>(
      builder: (context, state) {
        var cubit = ProductCubit.get(context);
        return
          Stack(
            children: [
              Container(
                padding:  EdgeInsetsDirectional.all(8.w),
                width: width,
                height: height,
                decoration: BoxDecoration(
                  border: Border.all(width: 1.w, color: AppColors.gray),
                  borderRadius: BorderRadiusDirectional.circular(15.r),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(child: Image.network(product.image ?? '', width:imageWidth,height: imageHeight,fit: BoxFit.cover,)),
                    Flexible(
                      child: TextCustom(
                        text: product.name?.tr(),
                        fontSize: 15.sp,
                        color: AppColors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                     SizedBox(height: 5.h,),
                    TextCustom(
                      text: product.title?.tr(),
                      fontSize: 14.sp,
                      color: AppColors.black,
                    ),
                     SizedBox(height: 5.h,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextCustom(
                          text: " £ ${product.price?? 0}" ,
                          fontSize: 15.sp,
                          color: AppColors.green,
                        ),
                        FloatingActionButtonCustom(
                          onPressed: onPressed,
                        ),
                      ],
                    )
                  ],
                ),
              ),

              IconButton(onPressed: onTap,
                icon: cubit.isFavorite
                    ? const Icon(
                  Icons.favorite_outlined,
                  color: AppColors.red,
                )
                    : const Icon(
                  Icons.favorite,
                  color: AppColors.gray,
                ),),
            ],
          );
      },
    );
  }
}

// ignore: must_be_immutable
class GroceriesProductCustom extends StatelessWidget {
  final ProductModel product;
  void Function()? onPressed;
  void Function()? onTap;

  GroceriesProductCustom(
      {required this.product, this.onTap, this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
        children: [Container(
          padding:  EdgeInsetsDirectional.all(10.w),
          width: 250.w,
          height: 120.h,
          decoration: BoxDecoration(
            color: AppColors.orange,
            border: Border.all(width: 1.w, color: AppColors.gray),
            borderRadius: BorderRadiusDirectional.circular(15.r),
          ),
          child: InkWell(
            onTap: onPressed,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Image.network(product.image ?? '',width: 100.w,height: 70.h,),
                    Flexible(
                      child: TextCustom(
                        text: product.name?.tr(),
                        fontSize: 20.sp,
                        color: AppColors.black,
                      ),
                    ),
                  ],
                ),
                TextCustom(
                  text:" \$ ${product.price?? 0}".tr() ,
                  textAlign: TextAlign.end,
                  color: AppColors.green,
                )
              ],
            ),
          ),
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


