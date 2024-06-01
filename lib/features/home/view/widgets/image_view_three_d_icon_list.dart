import 'package:flutter/material.dart';
import 'package:trip_planner360/features/home/view/widgets/panorama_image_view.dart';
import '../../../../core/constants/app_images.dart';
import '../../../../core/utils/CustomNavigator.dart';
import '../../model/category_model.dart';

class ImageView3dIconList extends StatelessWidget {
  const ImageView3dIconList({
    super.key,
    required this.attractionsModel,
  });

  final AttractionsModel attractionsModel;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.zero,
        itemCount: attractionsModel.images3d?.length ?? 1,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Material(
              elevation: 8,
              shape: const CircleBorder(),
              shadowColor: Colors.black,
              child: Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.black)),
                child: CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.white,
                  child: IconButton(
                    onPressed: () {
                      CustomNavigator.push(
                          context,
                          PanoramaImageView(
                            image: attractionsModel.images3d?[index]?? AppImages.talPasta3d1,
                          ));
                    },
                    icon: const Icon(
                      Icons.language,
                      size: 45,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
