import 'package:flutter/material.dart';
import 'package:trip_planner360/features/home/view/widgets/custom_categoris_app_bar.dart';
import '../../../core/utils/text_styles.dart';
import '../model/category_model.dart';
import 'widgets/image_view_three_d_icon_list.dart';

class SingleAttraction extends StatelessWidget {
  const SingleAttraction({
    super.key,
    required this.attractionsModel,
  });

  final AttractionsModel attractionsModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const CustomCategoriesAppBar(),
              Text(
                attractionsModel.name ??'',
                style: AppStyles.style22.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.asset(
                  attractionsModel.image,
                  height: 500,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                attractionsModel.details ?? '',
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('3D Images',style: AppStyles.style22.copyWith(fontWeight: FontWeight.bold),),
                  ],
                ),
              ImageView3dIconList(
                attractionsModel: attractionsModel,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

