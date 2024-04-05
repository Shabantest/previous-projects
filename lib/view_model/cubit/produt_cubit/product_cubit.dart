import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/i10/local_keys.g.dart';
import 'package:graduation_project/view_model/cubit/produt_cubit/product_states.dart';
import 'package:graduation_project/view_model/cubit/user_cubit/user_state.dart';
import 'package:graduation_project/view_model/firebase/firebase_keys.dart';

import '../../../model/product_model/product_model.dart';
import '../../uitils/images.dart';

class ProductCubit extends Cubit<ProductStates> {
  ProductCubit() : super(ProductInitialState());

  static ProductCubit get(context) => BlocProvider.of<ProductCubit>(context);
  TextEditingController searchController = TextEditingController();
  TextEditingController exploreSearchController = TextEditingController();
  List<ProductModel> exclusiveProducts = [];
  List<ProductModel> bestProducts = [];
  List<ProductModel> searchProduct = [];
  List<ProductModel> groceriesProducts = [];
  List<ProductModel> allProducts = [];

  Future<void> getProducts() async {
    try {
      emit(GetProductLoadingState());
      final product =
          await FirebaseFirestore.instance.collection("products").get();
      for (var i in product.docs) {
          allProducts.add(ProductModel.fromJson(i.data()));
      }
      emit(GetProductSuccessState());
    } catch (e) {
      emit(GetProductErrorState());
      print(e.toString());
      throw Exception(e.toString());
    }
  }

  bool isFavorite = false;

  void changeFavorite(bool value) {
    isFavorite = value;
    emit(ChangeFavouriteState());
  }

  void search(String value) {
    searchProduct.clear();
    emit(SearchLoadingState());
    for (var i in allProducts) {
      if ((i.name ?? '')
          .trim()
          .toLowerCase()
          .contains(value.trim().toLowerCase())) {
        searchProduct.add(i);
        emit(SearchSuccessState());
      }
    }
  }
//      if (product.docs.contains("Onions") ||
//             product.docs.contains("Garlic") ||
//             product.docs.contains("tomatoes")) {
//           bestProducts.add(ProductModel.fromJson(i.data()));
//         }
//         else if (product.docs.contains("Brockely") ||
//             product.docs.contains("carrot") ||
//             product.docs.contains("coloured pepper")) {
//           exclusiveProducts.add(ProductModel.fromJson(i.data()));
//         }
//         else if (product.docs.contains("ginger") ||
//             product.docs.contains("mushrooms") ){
//           groceriesProducts.add(ProductModel.fromJson(i.data()));
//         }else{
}
