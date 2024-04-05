import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
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
import 'all_exclusive_offer_view.dart';

class ExclusiveOfferSection extends StatelessWidget {
  const ExclusiveOfferSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductStates>(
      builder: (context, state) {
        var cubit = ProductCubit.get(context);
        var carCubit = ProductMangeCubit.get(context);
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextCustom(
                  text: LocaleKeys.ExclusiveOffer.tr(),
                  fontWeight: FontWeight.bold,
                  color: CupertinoColors.black,
                  fontSize: 24,
                ),
                TextButtonCustom(
                  text:LocaleKeys.SeeAll.tr(),
                  style: const TextStyle(
                    color: AppColors.green,
                    fontSize: 15,
                  ),
                  onPressed: () {
                    Navigation.push(context, const AllExclusiveOfferScreen());
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
                  imageWidth: 80,
                  imageHeight: 80,
                  onTap: () {
                      if (cubit.searchController.text.isEmpty) {
                        carCubit.addToFavourite(cubit.exclusiveProducts[index]);
                      } else {
                        carCubit.addToFavourite(
                          cubit.searchProduct[index],
                        );
                      }
                    },
                  onPressed: () {
                    if (cubit.searchController.text.isEmpty) {
                      carCubit.addToCart(cubit.exclusiveProducts[index]);
                    } else {
                      carCubit.addToCart(cubit.searchProduct[index]);
                    }
                  },
                  product: cubit.searchController.text.trim().isEmpty
                      ? cubit.exclusiveProducts[index]
                      : cubit.searchProduct[index],
                ),
                separatorBuilder: (context, index) => const SizedBox(
                  width: 20,
                ),
                itemCount: cubit.searchController.text.trim().isEmpty
                    ? cubit.exclusiveProducts.length
                    : cubit.searchProduct.length,
              ),
            ),
          ],
        );
      },
    );
  }
}
