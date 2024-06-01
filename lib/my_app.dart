import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trip_planner360/core/services/local_data/shared_helper.dart';
import 'package:trip_planner360/core/services/local_data/shared_keyes.dart';
import 'package:trip_planner360/features/auth/view_model/user_cubit.dart';
import 'package:trip_planner360/features/home/veiw_model/home_cubit.dart';
import 'package:trip_planner360/features/home/view/home_view.dart';
import 'features/splash/view/splash_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => UserCubit(),),
        BlocProvider(create: (context) => HomeCubit(),),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: SharedHelper.get(key: SharedKeys.userToken)== null? const SplashView():const HomeView(),
      ),
    );
  }
}
