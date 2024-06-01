
import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../veiw_model/home_cubit.dart';
class SearchCustom extends StatelessWidget {
  const SearchCustom({ super.key,required this.onChanged,required this.controller});
 final void Function(String)? onChanged;
 final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.symmetric(horizontal: 15),
      child: SearchBar(
        padding: const MaterialStatePropertyAll(EdgeInsetsDirectional.only(start: 40)),
        elevation: const MaterialStatePropertyAll(0.8),
        onChanged:onChanged,
        shape:const MaterialStatePropertyAll(RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          side: BorderSide(width: 1,color: AppColors.grey),
        )) ,
        controller: controller,
        leading: const Icon(Icons.search_sharp,color: AppColors.grey,size: 40,),
        hintText: "Search",
        hintStyle:const MaterialStatePropertyAll(TextStyle(
          fontSize: 17,
          color: AppColors.grey,
        )),
      ),
    );
  }
}

