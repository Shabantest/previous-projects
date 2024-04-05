import '../../view_model/uitils/images.dart';

class UserData{
  String? image;
  String? name;
  String? email;
  String? phone;
  String? location;

  UserData({this.image, this.name, this.email,this.location,this.phone});
}
 List<UserData> users=[

   UserData(
     image: AppImages.userImage,
     email: 'sbosafoona@gmail.com',
     name: 'Shaban ',
   ),
 ];