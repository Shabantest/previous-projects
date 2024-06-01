import 'package:flutter/material.dart';
import 'package:panorama_viewer/panorama_viewer.dart';
import 'package:sensors_plus/sensors_plus.dart';

class PanoramaImageView extends StatefulWidget {
   const PanoramaImageView({super.key, required this.image});
  final String image;

  @override
  State<PanoramaImageView> createState() => _PanoramaImageViewState();
}

class _PanoramaImageViewState extends State<PanoramaImageView> {
   double _pitch = 0.0;
  double _yaw = 0.0;
   double _currentLongitude = 0.0;
   double _currentLatitude = 0.0;
   @override
   void initState() {
     super.initState();
     gyroscopeEvents.listen((GyroscopeEvent event) {
       setState(() {
         _pitch += event.y;
         _yaw += event.x;
       });
     });
   }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: PanoramaViewer(
          sensorControl: SensorControl.absoluteOrientation,
          latitude:_pitch ,
          longitude: _yaw,
          child: Image.asset(widget.image),
          onViewChanged: (latitude,longitude,tilt){
            _currentLongitude=latitude;
            _currentLatitude=latitude;

          },
          // sensorControl: ,
        ),
      ),
    );
  }
}
