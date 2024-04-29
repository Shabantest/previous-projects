import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/i10/local_keys.g.dart';
import 'package:graduation_project/view_model/cubit/cart_cubit/product_mange_cubit.dart';
import 'package:graduation_project/view_model/cubit/produt_cubit/product_cubit.dart';
import 'package:graduation_project/view_model/cubit/produt_cubit/product_states.dart';
import 'package:graduation_project/view_model/uitils/Colors.dart';
import '../../../../../view_model/uitils/Text_custom.dart';
import '../componante/product_widget.dart';

class AllBestSellingScreen extends StatelessWidget {
  const AllBestSellingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductStates>(
      builder: (context, state) {
        var cubit = ProductCubit.get(context);
        var carCubit = ProductMangeCubit.get(context);
        if(state is GetProductLoadingState){
          return const CircularProgressIndicator(
            color: AppColors.green,
          );
        }else{ return Scaffold(
          body:  SafeArea(
            child: Center(
              child: Column(
                children: [
                  TextCustom(
                    text: LocaleKeys.BestSelling.tr(),
                    fontWeight: FontWeight.bold,
                    color: CupertinoColors.black,
                    fontSize: 24,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: GridView.builder(
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisExtent: 240,
                          mainAxisSpacing: 10,
                        ),
                        padding: const EdgeInsetsDirectional.all(10),
                        scrollDirection: Axis.vertical,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        itemBuilder: (context, index) => ProductWidget(
                          imageWidth: 100,
                            imageHeight: 100,
                            onTap: () {
                              carCubit.addToFavourite(cubit.bestProducts[index]);
                            },
                            onPressed: () {
                              carCubit.addToCart(cubit.bestProducts[index]);
                            },
                            product:cubit.bestProducts[index]
                        ),
                        itemCount:  cubit.bestProducts.length
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
        }

      },
    );
  }
}