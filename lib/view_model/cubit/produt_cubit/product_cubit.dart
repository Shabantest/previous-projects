import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/view_model/cubit/produt_cubit/product_states.dart';

import '../../../model/product_model/product_model.dart';

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

      for (var i=0;i<=product.docs.length;i++) {
          allProducts.add(ProductModel.fromJson(product.docs[i].data()));
          exclusiveProducts.add(ProductModel.fromJson(product.docs[i].data()));
          if(i == 1 || i== 2||i==20||i==6||i==16 ||i==17||i==4||i==8||i==9){
            bestProducts.add(ProductModel.fromJson(product.docs[i].data()));
          }
          if(i == 10 || i== 14){
            groceriesProducts.add(ProductModel.fromJson(product.docs[i].data()));
          }
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
      if ((i.name ?? '').tr()
          .trim()
          .toLowerCase()
          .contains(value.tr().trim().toLowerCase())) {
        searchProduct.add(i);
        emit(SearchSuccessState());
      }
    }
  }

}
