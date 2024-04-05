import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../model/product_model/product_model.dart';
import 'product_mange_states.dart';
class ProductMangeCubit extends Cubit<ProductMangeStates>{
  ProductMangeCubit():super(CartInitialState());
  static ProductMangeCubit get(context)=>BlocProvider.of<ProductMangeCubit>(context);
  int cartCounter=0;
  int favouriteCounter=0;
  double totalAmount=0;
   int productCounter=1;
  List<ProductModel> cartProducts = [];
  List<ProductModel> favouriteProducts = [];
  void calculateAmount(){
    totalAmount=0;
    for( var i in cartProducts){
      totalAmount+=productCounter*i.price!;
    }
    emit(CalculateTotalAmountState());
  }
  void addToCart( ProductModel product){
    cartProducts.add(product);
    cartCounter++;
    emit(CartSuccessAddState());
  }
  void removeFromCart(int index){
    cartProducts.removeAt(index);
    if(cartCounter>0) {
      cartCounter--;
    }
    emit(RemoveFromCartState());
  }
  void addToFavourite( ProductModel product ){
    favouriteProducts.add(product);
    favouriteCounter++;
    emit(FavouriteSuccessAddState());
  }
  void removeFromFavourite(ProductModel index){
    favouriteProducts.remove(index);
    if( favouriteCounter>0) {
      favouriteCounter--;
    }
    emit(RemoveFromFavouriteState());
  }
















}



















