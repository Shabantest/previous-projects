import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trip_planner360/features/home/veiw_model/home_cubit.dart';
import 'package:trip_planner360/features/home/view/single_attraction.dart';
import 'package:trip_planner360/features/home/view/widgets/custom_category_item.dart';
import 'package:trip_planner360/features/home/view/widgets/search_custom.dart';
import '../../../core/utils/CustomNavigator.dart';
import '../../../core/utils/text_styles.dart';
import '../model/category_model.dart';
import 'widgets/custom_categoris_app_bar.dart';

class AttractionsView extends StatelessWidget {
  const AttractionsView({
    super.key,
    required this.attractions,
    required this.placeName,
  });

  final List<AttractionsModel> attractions;
  final String placeName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(16),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const CustomCategoriesAppBar(),
            Text(
              placeName,
              style: AppStyles.style22.copyWith(fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 24,
            ),
            SearchCustom(
              onChanged: (value) {
                HomeCubit.get(context).searchInAttractions(value, attractions);
              },
              controller: HomeCubit.get(context).searchAttractionsController,
            ),
            const SizedBox(
              height: 10,
            ),
            BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                var cubit = HomeCubit.get(context);
                return GridView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount:
                        cubit.searchAttractionsController.text.trim().isEmpty
                            ? attractions.length
                            : cubit.searchAttractions.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio:
                          attractions.first.name == null ? .677 : .7,
                    ),
                    itemBuilder: (context, index) {
                      return CustomCategoryItem(
                        name: cubit.searchAttractionsController.text
                                .trim()
                                .isEmpty
                            ? attractions[index].name
                            : cubit.searchAttractions[index].name,
                        image: cubit.searchAttractionsController.text
                                .trim()
                                .isEmpty
                            ? attractions[index].image
                            : cubit.searchAttractions[index].image,
                        onTap: () {
                          CustomNavigator.push(
                            context,
                            SingleAttraction(
                              attractionsModel: cubit
                                      .searchAttractionsController.text
                                      .trim()
                                      .isEmpty
                                  ? attractions[index]
                                  : cubit.searchAttractions[index],
                            ),
                          );
                        },
                      );
                    });
              },
            ),
          ],
        ),
      ),
    ));
  }
}
