import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/i10/local_keys.g.dart';
import 'package:graduation_project/view_model/cubit/produt_cubit/product_cubit.dart';
import 'package:graduation_project/view_model/cubit/produt_cubit/product_states.dart';
import '../../../../view_model/uitils/Colors.dart';
import '../../../../view_model/uitils/Text_custom.dart';
import '../../../view_model/cubit/cart_cubit/product_mange_cubit.dart';
import '../../../view_model/uitils/icons.dart';
import 'component/explor_product_widget.dart';
class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit,ProductStates>(builder: (context, state) {
      var cubit=ProductCubit.get(context);
      if(state is GetProductLoadingState){
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            elevation: 0,
            backgroundColor: AppColors.white,
            title: TextCustom(
              text: LocaleKeys.FindProducts.tr(),
              fontWeight: FontWeight.bold,
              fontSize: 20.sp,
              color: AppColors.black,
            ),
          ),
          body: Padding(
            padding:  EdgeInsets.all(5.w),
            child: Column(
              children: [
                SearchBar(
                  controller: cubit.exploreSearchController,
                  keyboardType: TextInputType.text,
                  onChanged: (value) {
                    cubit.search(value);
                  },
                  hintText: LocaleKeys.Search.tr(),
                  leading: AppIcons.search,
                ),
                SizedBox(
                  height: 20.h,
                ),
                const CircularProgressIndicator(
                  color: AppColors.gray,
                ),
              ],
            ),
          ),
        );
      }else{
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            elevation: 0,
            backgroundColor: AppColors.white,
            title: TextCustom(
              text: LocaleKeys.FindProducts.tr(),
              fontWeight: FontWeight.bold,
              fontSize: 20.sp,
              color: AppColors.black,
            ),
          ),
          body: Padding(
            padding:  EdgeInsets.all(5.w),
            child: Column(
              children: [
                SearchBar(
                  controller: cubit.exploreSearchController,
                  keyboardType: TextInputType.text,
                  onChanged: (value) {
                    cubit.search(value);
                  },
                  hintText: LocaleKeys.Search.tr(),
                  leading: AppIcons.search,
                ),
                SizedBox(
                  height: 20.h,
                ),
                Expanded(
                  child: GridView.builder(
                    scrollDirection: Axis.vertical,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                    ),
                    itemBuilder: (context, index) => ExploreProductWidget(
                      onTap: () {
                        if(cubit.exploreSearchController.text.trim().isEmpty) {
                          ProductMangeCubit.get(context).addToFavourite(
                            cubit.allProducts[index],);
                        }else{
                          ProductMangeCubit.get(context).addToFavourite(
                            cubit.searchProduct[index],);
                        }
                      },
                      onPressed: () {
                        if(cubit.exploreSearchController.text.trim().isEmpty) {
                          ProductMangeCubit.get(context).addToCart(cubit.allProducts[index]);
                        }else{
                          ProductMangeCubit.get(context).addToCart(cubit.searchProduct[index]);
                        }
                      },
                      product: cubit.exploreSearchController.text.trim().isEmpty? cubit.allProducts[index]:
                      cubit.searchProduct[index],),
                    itemCount:cubit.exploreSearchController.text.trim().isEmpty? cubit.allProducts.length:
                    cubit.searchProduct.length,
                  ),
                ),
              ],
            ),
          ),
        );
      }

    },);
  }
}
