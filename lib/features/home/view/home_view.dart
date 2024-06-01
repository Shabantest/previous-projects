import 'package:flutter/material.dart';
import 'package:trip_planner360/features/home/view/widgets/custom_app_bar.dart';
import 'package:trip_planner360/features/home/view/widgets/custom_category_hotel_item.dart';
import 'package:trip_planner360/features/home/view/widgets/home_grid_view.dart';
import 'package:trip_planner360/features/home/view/widgets/search_custom.dart';

import '../../../core/constants/app_images.dart';
import '../../../core/utils/text_styles.dart';
import '../veiw_model/home_cubit.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(16),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 50),
            const CustomAppBar(),
            const SizedBox(height: 20),
            Text('  Hi there 👋',
                style: AppStyles.style18.copyWith(color: Colors.black)),
            Text('Take a virtual Sharqia Governorate',
                style: AppStyles.style22.copyWith(
                    color: Colors.black, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
             SearchCustom(
               controller:   HomeCubit.get(context).searchCategoriesController,
               onChanged: (value) {
              HomeCubit.get(context).searchInCategories(value);
            },),
            const SizedBox(
              height: 20,
            ),
            const HomeGridView(),
           const SizedBox(height: 10),
            const AspectRatio(
              aspectRatio:  1.9,
              child:  CustomCategoryHotelItem(
                image: AppImages.heartAttack2,
                name: 'Hotels',
              ),     ),
        ]
        ),
      ),
    ));
  }
}
