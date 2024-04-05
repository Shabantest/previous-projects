import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/view_model/data/local/shared_helper.dart';
import 'package:graduation_project/view_model/data/local/shared_keyes.dart';
import 'package:graduation_project/view_model/services/services.dart';
import 'firebase_options.dart';
import 'my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await initialServices();
  SharedHelper.init();
  var usertoken =  await SharedHelper.get(key: SharedKeys.userToken);
  print(usertoken);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ar')],
      path: 'assets/translations',
      // <-- change the path of the translation files
      fallbackLocale: const Locale('en'),
      saveLocale: true,
      child: const MyApp()));
}
