import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:graduation_project/view_model/data/local/shared_helper.dart';
import 'package:graduation_project/view_model/data/local/shared_keyes.dart';
import 'package:graduation_project/view_model/firebase/firebase_keys.dart';
import 'package:graduation_project/view_model/uitils/Colors.dart';
import 'user_state.dart';

class UserCubit extends Cubit<UserStates> {
  UserCubit() : super(UserInitialSate());

  static UserCubit get(context) => BlocProvider.of<UserCubit>(context);
  TextEditingController signUserNameController = TextEditingController();
  TextEditingController signEmailController = TextEditingController();
  TextEditingController signPasswordController = TextEditingController();
  TextEditingController loginEmailController = TextEditingController();
  TextEditingController loginPasswordController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController userAddressController = TextEditingController();
  TextEditingController promoCodeController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  GlobalKey<FormState> singFormKey = GlobalKey<FormState>();
  bool obscure = true;

  void checkPass() {
    obscure = !obscure;
    emit(UserCheckPassSate());
  }

  Future<void> signUseFirebase() async {
    emit(AddUserLodaingState());
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
      email: signEmailController.text,
      password: signPasswordController.text,
    )
        .then(
      (value) async {
        emit(UserSignSuccessSate());
        await FirebaseFirestore.instance
            .collection(FirebaseKeys.users)
            .doc(value.user?.email)
            .set({
          'name': signUserNameController.text,
          'id': value.user?.uid,
          'email': signEmailController.text,
          'password': signPasswordController.text,
          'phoneNumber': phoneNumberController.text,
        });
      },
    ).catchError((error) {
      emit(UserSignErrorSate());
      Fluttertoast.showToast(
          timeInSecForIosWeb: 10,
          msg: error.toString(),
          backgroundColor: AppColors.red,
          fontSize: 15,
          toastLength: Toast.LENGTH_SHORT,
          textColor: AppColors.white);
      throw error;
    });
  }

  Future<void> loginUserFirebase() async {
    emit(UserLoginLoadingState());
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(
      email: loginEmailController.text,
      password: loginPasswordController.text,
    )
        .then(
      (value) async {
        await SharedHelper.set(key: SharedKeys.userId, value: value.user?.uid);
        await SharedHelper.set(
            key: SharedKeys.userEmail, value: value.user?.email);
        await SharedHelper.set(
            key: SharedKeys.userToken, value: value.user?.uid);
        await SharedHelper.set(
            key: SharedKeys.userName,value:signUserNameController.text);
        emit(UserLoginSuccessState());
      },
    ).catchError((error) {
      emit(UserLoginErrorSate());
      print(error.toString());
      Fluttertoast.showToast(
          timeInSecForIosWeb: 10,
          msg: error.toString(),
          backgroundColor: AppColors.red,
          fontSize: 15,
          toastLength: Toast.LENGTH_SHORT,
          textColor: AppColors.white);
      throw error;
    });
  }
   ConnectivityResult?  checkConnection;
  Future<void> checkConnectivity() async {
    ConnectivityResult connectivityResult =
    (await Connectivity().checkConnectivity()) as ConnectivityResult;
      checkConnection =connectivityResult;
      emit(CheckInterNetAccessState());
  }
}
