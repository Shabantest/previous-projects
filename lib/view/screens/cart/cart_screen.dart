import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/i10/local_keys.g.dart';
import 'package:graduation_project/view_model/cubit/cart_cubit/product_mange_cubit.dart';
import 'package:graduation_project/view_model/cubit/cart_cubit/product_mange_states.dart';
import 'package:graduation_project/view_model/uitils/images.dart';
import '../../../../view_model/uitils/Colors.dart';
import '../../../../view_model/uitils/Text_custom.dart';
import '../../componants/material_Button.dart';
import 'component/cart_product_widget.dart';
import '../check_out/checkout_dialog_Widget.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.deepGreen,
        centerTitle: true,
        title: TextCustom(
          text: LocaleKeys.MyCart.tr(),
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: AppColors.black,
        ),
      ),
      body: Padding(
        padding:  EdgeInsets.only(bottom: 20.w, left: 10.w, right: 10.w),
        child: BlocBuilder<ProductMangeCubit, ProductMangeStates >(
          builder: (context, state) {
            var cubit = ProductMangeCubit.get(context);
            return Visibility(
              visible: cubit.cartProducts.isNotEmpty,
              replacement: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(AppImages.cartEmpty),
                    TextCustom(
                      text: LocaleKeys.YourCartIsEmpty.tr(),
                      color: AppColors.green,
                      fontWeight: FontWeight.bold,
                      fontSize: 17.sp,
                    ),
                  ],
                ),
              ),
              child: Column(
                children: [
                  Expanded(
                    child: ListView.separated(
                        itemBuilder: (context, index) => CartProductWidget(
                          onPressed: () {
                            cubit.removeFromCart(index);
                          },
                          cartProduct: cubit.cartProducts[index],
                        ),
                        separatorBuilder: (context, index) =>  SizedBox(
                          height: 10.h,
                        ),
                        itemCount: cubit.cartProducts.length),
                  ),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 20.w),
                    child: MaterialButtonCusttom(
                      color: AppColors.green,
                      textcolor: AppColors.white,
                      text: LocaleKeys.GoToCheckout.tr(),
                      onPressed: () {
                        if (cubit.cartProducts.isNotEmpty) {
                          cubit.calculateAmount();
                          print(cubit.totalAmount);
                          showDialog(context: context, builder: (context) {
                            return const CheckOutDialogWidget();},
                          );
                        }
                      }
                    ),
                  ),
                ],
              ),
            );
          },
        )
      ),
    );
  }
}
