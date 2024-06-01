import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/CustomNavigator.dart';
import '../../veiw_model/home_cubit.dart';
import '../single_category.dart';
import 'custom_category_item.dart';

class HomeGridView extends StatelessWidget {
  const HomeGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        var cubit = HomeCubit.get(context);
        return GridView.builder(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: cubit.searchCategoriesController.text
              .trim()
              .isEmpty ? cubit.categories.length: cubit.searchCategories.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: .80),
          itemBuilder: (context, index) {
            return CustomCategoryItem(
              onTap: () {
                cubit.searchSingleCategoriesController.clear();
                CustomNavigator.push(
                    context,
                    SingleCategory(
                      categoryName: cubit.searchCategoriesController.text
                          .trim()
                          .isEmpty ? cubit.categories[index].name: cubit.searchCategories[index].name,
                      places: cubit.searchCategoriesController.text
                          .trim()
                          .isEmpty ? cubit.categories[index].touristPlaces: cubit.searchCategories[index].touristPlaces,
                    ));
              },
              image: cubit.searchCategoriesController.text
                  .trim()
                  .isEmpty ? cubit.categories[index].image: cubit.searchCategories[index].image,
              // height: 150,
              name: cubit.searchCategoriesController.text
                  .trim()
                  .isEmpty ? cubit.categories[index].name: cubit.searchCategories[index].name,
            );
          },
        );
      },
    );
  }
}
