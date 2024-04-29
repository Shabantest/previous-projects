import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/view_model/cubit/cart_cubit/product_mange_cubit.dart';
import 'package:graduation_project/view_model/cubit/produt_cubit/product_cubit.dart';
import 'package:graduation_project/view_model/cubit/produt_cubit/product_states.dart';
import '../../../../../view_model/uitils/Colors.dart';
import '../../../../../view_model/uitils/Text_custom.dart';
import '../../../../i10/local_keys.g.dart';
import '../../../../view_model/uitils/navigation.dart';
import '../../../componants/text_button.dart';
import '../componante/product_widget.dart';
import 'all_best_selling_view.dart';

class BestSellingSction extends StatelessWidget {
  const BestSellingSction({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductStates>(
      builder: (context, state) {
        var productCubit = ProductCubit.get(context);
        var cartCubit = ProductMangeCubit.get(context);
        if(state is GetProductLoadingState){
          return const CircularProgressIndicator(
            color:  AppColors.green,
          );
        }else{
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextCustom(
                    text: LocaleKeys.BestSelling.tr(),
                    fontWeight: FontWeight.bold,
                    color: CupertinoColors.black,
                    fontSize: 24,
                  ),
                  TextButtonCustom(
                    text:LocaleKeys.SeeAll.tr(),
                    style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: AppColors.green),
                    onPressed: () {
                      Navigation.push(context,const AllBestSellingScreen());
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 240,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => ProductWidget(
                      imageHeight: 100,
                      imageWidth: 100,
                      onTap: () {
                        cartCubit.addToFavourite(productCubit.bestProducts[index],);
                      },
                      onPressed: () {
                        cartCubit.addToCart(productCubit.bestProducts[index]);
                      },
                      product: productCubit.bestProducts[index]),
                  separatorBuilder: (context, index) => const SizedBox(
                    width: 20,
                  ),
                  itemCount: productCubit.bestProducts.length,
                ),
              ),
            ],
          );
        }

      },
    );
  }
}
