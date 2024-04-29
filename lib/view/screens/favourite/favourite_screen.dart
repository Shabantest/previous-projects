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
import 'component/favourite_procut_component.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: TextCustom(
       text:  LocaleKeys.Favorite.tr(),
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      body: Padding(
        padding:   EdgeInsetsDirectional.only(bottom: 20.w,start: 10.w,end: 10.w),
        child: BlocBuilder<ProductMangeCubit,ProductMangeStates>(
          builder: (context, state) {
            var cubit =ProductMangeCubit.get(context);
            return Visibility(
               visible: cubit.favouriteProducts.isNotEmpty,
              replacement: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(AppImages.favoriteEmpty,color: AppColors.green,width: 200.w,height: 200.h,),
                    TextCustom(
                      text:  LocaleKeys.YourFavoriteIsEmpty.tr(),
                      fontSize: 17.sp,
                      color: AppColors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
              ),
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                        itemBuilder: (context, index) =>
                            FavouriteProductCustom(
                              onTap: () {
                                cubit.removeFromFavourite(cubit.favouriteProducts[index],);
                              },
                              onPressed: () {
                                cubit.addToCart(cubit.favouriteProducts[index]);
                              },
                                product: cubit.favouriteProducts[index]),
                        itemCount: cubit.favouriteProducts.length),
                  ),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 20.w),
                    child: MaterialButtonCustom(
                      color: AppColors.green,
                      textColor: AppColors.white,
                      text:LocaleKeys.AddAllToCart.tr(),onPressed: () {

                          for(var i in cubit.favouriteProducts){
                            cubit.addToCart(i);
                          }
                    },),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
