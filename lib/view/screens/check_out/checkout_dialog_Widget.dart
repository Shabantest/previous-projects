import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/i10/local_keys.g.dart';
import 'package:graduation_project/view/screens/check_out/sections/payment_section.dart';
import 'package:graduation_project/view_model/cubit/cart_cubit/product_mange_states.dart';
import '../../../../view_model/uitils/Colors.dart';
import '../../../../view_model/uitils/Text_custom.dart';
import '../../../../view_model/uitils/navigation.dart';
import '../../../view_model/cubit/cart_cubit/product_mange_cubit.dart';
import '../../../view_model/uitils/icons.dart';
import '../../componants/material_Button.dart';
import '../order_accepted/orderScreen.dart';
import 'component/checkout_options_widget.dart';
import 'sections/delivery_sction.dart';
import 'sections/promo_code_sction.dart';
class CheckOutDialogWidget extends StatelessWidget {
  const CheckOutDialogWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return   BlocBuilder<ProductMangeCubit,ProductMangeStates>(
      builder: (context, state) {
        var cartCubit=ProductMangeCubit.get(context);
     return   AlertDialog(
          backgroundColor: const Color.fromRGBO(237, 247, 236, 1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusDirectional.circular(15.r),
            side:  BorderSide(
                color: AppColors.gray, width: 1.w),
          ),
          title: Row(
            children: [
              Expanded(
                child: TextCustom(
                  text: LocaleKeys.Checkout.tr(),
                  fontWeight: FontWeight.bold,
                  color: AppColors.green,
                ),
              ),
            ],
          ),
          content:  Container(
            width: 400.w,
            decoration:   BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20.r)),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CheckOutOptionsWidget(
                  icon: AppIcons.arrow_back,
                  name: LocaleKeys.Delivery.tr(),
                  title: LocaleKeys.DeliveryAddress.tr(),
                  onPressed: () {
                    Navigation.push(context,  DeliveryScreen());
                  },
                ),
                CheckOutOptionsWidget(
                  icon: AppIcons.arrow_back,
                  name: LocaleKeys.PromoCode.tr(),
                  title: LocaleKeys.PickDiscount.tr(),
                  onPressed: () {
                    Navigation.push(context, const PromoCodeScreen());
                  },
                ),
                CheckOutOptionsWidget(
                  icon: AppIcons.arrow_back,
                  name: LocaleKeys.Payment.tr(),
                  onPressed: () {
                    Navigation.push(context,  const CheckoutPage());
                  },
                ),
                CheckOutOptionsWidget(
                  icon: AppIcons.arrow_back,
                  name: LocaleKeys.TotalCost.tr(),
                  title: '\$ ${cartCubit.totalAmount.toInt()} ',
                  onPressed: () {},
                ),
                 SizedBox(
                  height: 40.h,
                ),
                TextCustom(
                  text:LocaleKeys.ByPlacingAnOrderYouAgreeToOur.tr(),
                  fontSize: 15.sp,
                  color: AppColors.black,
                ),
                TextCustom(
                  text: LocaleKeys.TermsAndConditions.tr(),
                  fontSize: 10.sp,
                  color: AppColors.black,
                ),
              ],
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: MaterialButtonCusttom(
                color: AppColors.green,
                textcolor: AppColors.white,
                text: LocaleKeys.PlaceOrder.tr(),
                onPressed: () {
                  Navigation.push(context, const OrderScreen());
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
