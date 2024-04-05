import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/view_model/data/local/shared_helper.dart';
import 'package:graduation_project/view_model/data/local/shared_keyes.dart';
import 'view/screens/onbording/splash_screen.dart';
import 'view_model/cubit/cart_cubit/product_mange_cubit.dart';
import 'view_model/cubit/produt_cubit/product_cubit.dart';
import 'view_model/cubit/user_cubit/user_cubit.dart';
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProductCubit(),
        ),
        BlocProvider(
          create: (context) => UserCubit(),
        ),
        BlocProvider(create: (context) =>ProductMangeCubit() ,),
      ],
      child:  ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            debugShowCheckedModeBanner: false,
            home:child,
          );
        },
          child:const SplashScreen(),
      ),
    );
  }
}
