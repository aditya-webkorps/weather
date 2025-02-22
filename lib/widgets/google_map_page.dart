import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapPage extends StatefulWidget {
  const GoogleMapPage({super.key});

  @override
  State<GoogleMapPage> createState() => _GoogleMapPageState();
}

class _GoogleMapPageState extends State<GoogleMapPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: GoogleMap(
        myLocationEnabled: true,

        initialCameraPosition:
            CameraPosition(target: LatLng(18.5197, 73.8452), zoom: 16),
      )),
    );
  }
}
