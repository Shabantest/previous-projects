import 'dart:async';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:graduation_project/view/componants/material_Button.dart';
import 'package:graduation_project/view_model/cubit/user_cubit/user_cubit.dart';
import 'package:graduation_project/view_model/cubit/user_cubit/user_state.dart';
import 'package:graduation_project/view_model/uitils/Colors.dart';
import 'package:graduation_project/view_model/uitils/images.dart';
import '../../../../i10/local_keys.g.dart';
import '../../../../view_model/uitils/Text_custom.dart';

class DeliveryScreen extends StatelessWidget {
   DeliveryScreen({super.key});
  final Completer<GoogleMapController> _controller =
  Completer<GoogleMapController>();
  static const CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(237, 247, 236, 1),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(237, 247, 236, 1),
        title: Row(
          children: [
            Expanded(
              child: TextCustom(
                text: LocaleKeys.DeliveryAddress.tr(),
                color: AppColors.Orange,
                fontWeight: FontWeight.bold,
                fontSize: 26.sp,
              ),
            ),
             Icon(
              Icons.delivery_dining_outlined,
              color: AppColors.Orange,
              size: 40.w,
            ),
          ],
        ),
      ),
      body: BlocBuilder<UserCubit,UserStates>(
        builder: (context, state) {
          var cubit= UserCubit.get(context);
          return  Padding(
            padding: const EdgeInsetsDirectional.symmetric(horizontal: 12,vertical: 10),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 300.h,
                      child: GoogleMap(
                      mapType: MapType.normal,
                      initialCameraPosition:_kLake,
                      onMapCreated: (GoogleMapController controller) {
                        _controller.complete(controller);
                      }
                      ),
                    ),
                    MaterialButtonCusttom(
                      color: Colors.blue,
                      onPressed: () {

                      },
                      text: "confirm",
                      textcolor: Colors.white,
                    )
                  ],
                ),
              ),
          );
        },
      ),
    );
  }
}
