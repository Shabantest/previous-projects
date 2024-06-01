// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:trip_planner360/features/auth/view_model/user_states.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/services/local_data/shared_helper.dart';
import '../../../core/services/local_data/shared_keyes.dart';
class UserCubit extends Cubit<UserStates> {
  UserCubit() : super(UserInitialState());

  static UserCubit get(context) => BlocProvider.of<UserCubit>(context);
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController dateOfBrithController = TextEditingController();
  TextEditingController nationalityController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailLoginController = TextEditingController();
  TextEditingController passwordLoginController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> signUserFirebase() async {
    emit(UserSignLoadingState());
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
            email: emailController.text, password: passwordController.text)
        .then((value) async {
      emit(UserSignSuccessState());

    }).catchError((e) {
      emit(UserSignErorrState());
      Fluttertoast.showToast(
        msg: e.toString(),
        backgroundColor: AppColors.red,
        fontSize: 18,
        textColor: AppColors.white,
        toastLength: Toast.LENGTH_SHORT,
      );
      throw e;
    });
  }

  Future<void> loginFirebase() async {
    emit(UserLoginLoadingState());
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(
            email: emailLoginController.text,
            password: passwordLoginController.text)
        .then((value) async{
          emit(UserLoginSuccessState());
          await SharedHelper.set(key: SharedKeys.userToken, value: value.user?.uid);
    },)
        .catchError((e){
          emit(UserLoginErorrState());
          Fluttertoast.showToast(msg:e.toString() ,
          backgroundColor: AppColors.red,
          fontSize: 18,
          toastLength: Toast.LENGTH_SHORT,
          );
          throw e;
    });
  }

}
