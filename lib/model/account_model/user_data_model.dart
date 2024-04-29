import '../../view_model/uitils/images.dart';

class UserData{
  String? image;
  String? name;
  String? email;
  String? phone;
  String? location;

  UserData({this.image, this.name, this.email,this.location,this.phone});
  factory UserData.fromJson(Map<String,dynamic> json){
    return UserData(
        name :json['name'],
        email :json['email'],
        phone :json['phoneNumber'],
    );
  }
}
