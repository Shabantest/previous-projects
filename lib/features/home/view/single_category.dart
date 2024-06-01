import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trip_planner360/features/home/veiw_model/home_cubit.dart';
import 'package:trip_planner360/features/home/view/widgets/custom_category_item.dart';
import 'package:trip_planner360/features/home/view/widgets/search_custom.dart';

import '../../../core/utils/CustomNavigator.dart';
import '../../../core/utils/text_styles.dart';
import '../model/category_model.dart';
import 'attractions_view.dart';
import 'widgets/custom_categoris_app_bar.dart';

class SingleCategory extends StatelessWidget {
  const SingleCategory(
      {super.key, required this.places, required this.categoryName});

  final List<TouristPlaceModel> places;
  final String categoryName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const CustomCategoriesAppBar(),
              const SizedBox(
                height: 20,
              ),
              Text(
                categoryName,
                style: AppStyles.style22.copyWith(fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 20,
              ),
              SearchCustom(
                controller:
                    HomeCubit.get(context).searchSingleCategoriesController,
                onChanged: (value) {
                  HomeCubit.get(context)
                      .searchInSingleCategories(value, places);
                },
              ),
              BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  var cubit = HomeCubit.get(context);
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: cubit.searchSingleCategoriesController.text
                            .trim()
                            .isEmpty
                        ? places.length
                        : cubit.searchSingleCategories.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: CustomCategoryItem(
                          name: cubit.searchSingleCategoriesController.text
                                  .trim()
                                  .isEmpty
                              ? places[index].name
                              : cubit.searchSingleCategories[index].name,
                          image: cubit.searchSingleCategoriesController.text
                                  .trim()
                                  .isEmpty
                              ? places[index].image
                              : cubit.searchSingleCategories[index].image,
                          onTap: () {
                            cubit.searchAttractionsController.clear();
                            CustomNavigator.push(
                              context,
                              AttractionsView(
                                attractions: cubit.searchSingleCategoriesController.text
                                    .trim()
                                    .isEmpty
                                    ? places[index].attractions
                                    : cubit.searchSingleCategories[index].attractions,
                                placeName: cubit.searchSingleCategoriesController.text
                                    .trim()
                                    .isEmpty
                                    ? places[index].name
                                    : cubit.searchSingleCategories[index].name,
                              ),
                            );
                          },
                        ),
                      );
                    },
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
