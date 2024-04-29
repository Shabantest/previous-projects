
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/i10/local_keys.g.dart';
import 'package:graduation_project/view_model/cubit/cart_cubit/product_mange_cubit.dart';
import 'package:graduation_project/view_model/cubit/cart_cubit/product_mange_states.dart';
import 'package:graduation_project/view_model/uitils/Text_custom.dart';
import '../../view_model/uitils/Colors.dart';
import '../../view_model/uitils/icons.dart';
import '../screens/account/account_screen.dart';
import '../screens/cart/cart_screen.dart';
import '../screens/explore/explore_screen.dart';
import '../screens/favourite/favourite_screen.dart';
import '../screens/home/home_screen.dart';


class BottomNavigationCustom extends StatefulWidget {
   const BottomNavigationCustom({super.key});

  @override
  State<BottomNavigationCustom> createState() => _BottomNavigationCustomState();
}

class _BottomNavigationCustomState extends State<BottomNavigationCustom> {
   int currentIndex =0;

   List<Widget> screens=[
     const HomeScreen(),
     const ExploreScreen(),
     const CartScreen(),
     const FavouriteScreen(),
     const AccountScreen(),
   ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
        body:screens[currentIndex] ,
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (value) {
            setState(() {
              currentIndex=value;
            });
          },
          showUnselectedLabels: true,
            selectedItemColor: AppColors.green,
            unselectedItemColor:AppColors.black,
            items:   [
          BottomNavigationBarItem(
            backgroundColor: Colors.transparent,
            icon: AppIcons.shop,
            label: LocaleKeys.Shop.tr(),
          ),
          BottomNavigationBarItem(
            icon: AppIcons.explore,
            label:  LocaleKeys.Explore.tr(),
          ),
              BottomNavigationBarItem(
            icon: AppIcons.Cart,
            label:  LocaleKeys.Cart.tr(),
          ),
          BottomNavigationBarItem(
            icon: AppIcons.favoured,
            label: LocaleKeys.Favorite.tr(),
          ),
          BottomNavigationBarItem(
            icon: AppIcons.person,
            label: LocaleKeys.Account.tr(),
          ),
        ]),
      ),
        Align(
          alignment: Alignment.bottomCenter,
          child:BlocBuilder<ProductMangeCubit,ProductMangeStates>(
            builder: (context, state) {
              var cubit= ProductMangeCubit.get(context);
              return  Row(
                  children: [
                     SizedBox(width: 160.w,),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CircleAvatar(
                          radius: 11.r,
                          backgroundColor: AppColors.red,
                          child: TextCustom(
                                text: "${cubit.cartCounter}",
                                color: AppColors.white,
                              ),


                        ),
                         SizedBox(height: 40.h,),
                      ],
                    ),
                     SizedBox(width: 50.w,),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CircleAvatar(
                          radius: 11.r,
                          backgroundColor: AppColors.red,
                          child:  TextCustom(
                                text: "${cubit.favouriteCounter}",
                                color: AppColors.white,
                              ),
                        ),
                         SizedBox(height: 40.h,),
                      ],
                    ),
                  ]
              );
            },
          )
        )
    ]
    );
  }
}
