
class ProductModel {
  String? image;
  String? name;
  String? title;
  int? price;

  ProductModel({this.title, this.image, this.price=0, this.name});

  factory ProductModel.fromJson(Map<String,dynamic> json){
    return ProductModel(
      name: json['name'],
      price: json['price'],
      title: json['description'],
      image: json['image'],
    ) ;

  }
}