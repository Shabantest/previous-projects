class UserModel {
  String? name;
  String? email;
  String? password;
  String? gender;
  String? dateOfBirth;
  String? nationality;
  UserModel({this.name,this.email,this.dateOfBirth,this.gender,this.nationality,this.password});
  factory UserModel.fromJson(Map<String,dynamic> json){
    return UserModel(
      name: json["name"],
      email: json["email"],
      password: json["email"],
      gender: json["email"],
      dateOfBirth: json["dateOfBirth"],
      nationality: json["nationality"],
    );
  }
}