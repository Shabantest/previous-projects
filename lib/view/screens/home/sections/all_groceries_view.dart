import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/view_model/cubit/cart_cubit/product_mange_cubit.dart';
import 'package:graduation_project/view_model/cubit/produt_cubit/product_cubit.dart';
import 'package:graduation_project/view_model/cubit/produt_cubit/product_states.dart';
import '../../../../../view_model/uitils/Text_custom.dart';
import '../../../../i10/local_keys.g.dart';
import '../../../../view_model/uitils/Colors.dart';
import '../componante/product_widget.dart';

class AllGroceriesView extends StatelessWidget {
  const AllGroceriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit,ProductStates>(builder: (context, state) {
      var cubit= ProductCubit.get(context);
      var cartCubit= ProductMangeCubit.get(context);
      return Scaffold(
        backgroundColor: AppColors.deepGreen,
        body:  SafeArea(
          child: Center(
            child: Column(
              children: [
                TextCustom(
                  text: LocaleKeys.Groceries.tr(),
                  fontWeight: FontWeight.bold,
                  color: CupertinoColors.black,
                  fontSize: 24,
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: ListView.separated(
                    padding: const EdgeInsetsDirectional.only(start: 70),
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) =>
                        GroceriesProductCustom(
                            onTap: () {
                              cartCubit.addToFavourite(cubit.groceriesProducts[index],);
                            },
                            onPressed: () {
                              cartCubit.addToCart(cubit.groceriesProducts[index]);
                            },
                            product: cubit.groceriesProducts[index]),
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 20,
                    ),
                    itemCount: cubit.groceriesProducts.length,
                  ),
                ),
      ],
            ),
          ),
        ),
      );
    },);
  }
}
