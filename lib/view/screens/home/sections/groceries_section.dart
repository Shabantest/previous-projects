import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/view/screens/home/sections/all_groceries_view.dart';
import 'package:graduation_project/view_model/cubit/cart_cubit/product_mange_cubit.dart';
import 'package:graduation_project/view_model/cubit/produt_cubit/product_cubit.dart';
import 'package:graduation_project/view_model/cubit/produt_cubit/product_states.dart';
import '../../../../../view_model/uitils/Colors.dart';
import '../../../../../view_model/uitils/Text_custom.dart';
import '../../../../i10/local_keys.g.dart';
import '../../../../view_model/uitils/navigation.dart';
import '../../../componants/text_button.dart';
import '../componante/product_widget.dart';

class GroceriesSection extends StatelessWidget {
  const GroceriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit,ProductStates>(builder: (context, state) {
      var cubit= ProductCubit.get(context);
      return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextCustom(
                text:LocaleKeys.Groceries.tr(),
                fontWeight: FontWeight.bold,
                color: CupertinoColors.black,
                fontSize: 24,
              ),
              TextButtonCustom(
                text:LocaleKeys.SeeAll.tr(),
                style: const TextStyle(
                  color: AppColors.green,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
                onPressed: () {
                  Navigation.push(context,const AllGroceriesView());
                },
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 140,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) =>
                  GroceriesProductCustom(

                      onTap: () {
                   ProductMangeCubit.get(context).addToFavourite(cubit.groceriesProducts[index],);
                      },
                      onPressed: () {
                        ProductMangeCubit.get(context).addToCart(cubit.groceriesProducts[index]);
                      },
                      product: cubit.groceriesProducts[index]),
              separatorBuilder: (context, index) => const SizedBox(
                width: 20,
              ),
              itemCount: cubit.groceriesProducts.length,
            ),
          ),
        ],
      );
    },);
  }
}
