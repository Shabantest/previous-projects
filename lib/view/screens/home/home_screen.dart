import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/view/screens/home/sections/best_%20selling_section.dart';
import 'package:graduation_project/view/screens/home/sections/exclusive_offer_section.dart';
import 'package:graduation_project/view/screens/home/sections/groceries_section.dart';
import 'package:graduation_project/view/screens/home/sections/section_bar.dart';
import 'package:graduation_project/view_model/cubit/produt_cubit/product_cubit.dart';
import 'package:graduation_project/view_model/cubit/produt_cubit/product_states.dart';
import 'package:graduation_project/view_model/data/local/shared_keyes.dart';
import '../../../i10/local_keys.g.dart';
import '../../../view_model/data/local/shared_helper.dart';
import '../../../view_model/uitils/icons.dart';
import '../../../view_model/uitils/images.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();

}

class _HomeScreenState extends State<HomeScreen> {
  @override
  @override
  void initState(){
    super.initState();
    var  cubit=ProductCubit.get(context);
    cubit.getProducts();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductStates>(
      builder: (context, state) {
        var cubit=ProductCubit.get(context);
        return Scaffold(
          body: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 12.w),
            child: SafeArea(
                child: Column(
                  children: [
                const SectionBAr(),
                SearchBar(
                  controller: cubit.searchController,
                  keyboardType: TextInputType.text,
                  onTap: (){
                    var token =SharedHelper.get(key: SharedKeys.userName);
                    print(token);
                  },
                  onChanged: (value) {
                    cubit.search(value);
                  },
                  hintText: LocaleKeys.Search.tr(),
                  leading: AppIcons.search,
                ),
                    SizedBox(
                      height: 10.h,
                    ),
                    CarouselSlider(
                      items: [
                        Image.asset(AppImages.vegetables),
                      ],
                      options: CarouselOptions(
                        autoPlay: true,
                        aspectRatio: 4,
                        animateToClosest: true,
                        autoPlayCurve: Curves.linear,
                        disableCenter: true,
                      ),
                    ),
                Expanded(
                  child: ListView(
                    children: [Column(
                      children: [
                        const ExclusiveOfferSection(),
                         SizedBox(
                          height: 20.h,
                        ),
                        const BestSellingSction(),
                         SizedBox(
                          height: 20.h,
                        ),
                        const GroceriesSection(),
                         SizedBox(
                          height: 20.h,
                        ),
                        // MeetSection(),
                      ],
                    ),
              ],
                  ),
                ),
                              ],
                            )),
          ),
        );
      },
    );
  }
}
