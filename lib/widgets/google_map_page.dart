import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapPage extends StatefulWidget {
  const GoogleMapPage({super.key});

  @override
  State<GoogleMapPage> createState() => _GoogleMapPageState();
}

class _GoogleMapPageState extends State<GoogleMapPage> {
  late GoogleMapController _controller;
  MapType mapType = MapType.normal;
  LatLng selectedLatLng = LatLng(18.5197, 73.8452);
  List<Placemark> placemarks = [];

  void _onMapCreated(GoogleMapController controller) {
    _controller = controller;
  }

  @override
  void initState() {
    super.initState();
  }

  void animateController() {
    _controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: LatLng(18.459410, 73.830910))));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(children: [
          GoogleMap(
            zoomControlsEnabled: true,
            mapType: MapType.normal,
            onMapCreated: (controller) {
              _onMapCreated(controller);
            },
            onLongPress: (LatLng selectedLatLng) async {
              List<Placemark> placemarks = await placemarkFromCoordinates(
                  selectedLatLng.latitude, selectedLatLng.longitude);
              this.placemarks = placemarks;
              print(placemarks.first);

              setState(() {
                this.selectedLatLng = selectedLatLng;
              });
            },
            markers: {
              Marker(
                markerId: MarkerId("Selected location"),
                position: selectedLatLng,
                infoWindow: InfoWindow(
                  title:
                      "${selectedLatLng.latitude}, ${selectedLatLng.longitude}",
                ),
              )
            },
            myLocationEnabled: true,
            initialCameraPosition: CameraPosition(
              target: LatLng(18.5197, 73.8452),
              zoom: 16,
            ),
          ),
          Positioned(
            bottom: 15.0,
            left: 10,
            right: 60,
            child: Card(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "${selectedLatLng.latitude.toStringAsFixed(4)}, ${selectedLatLng.longitude.toStringAsFixed(4)}",
                      style: TextStyle(fontSize: 18.0),
                    ),
                    Text(
                      placemarks.isEmpty
                          ? ""
                          : "${placemarks[1].isoCountryCode}, ${placemarks[1].name}, ${placemarks[1].subLocality}, ${placemarks[1].locality}, ${placemarks[1].postalCode}",
                      style: TextStyle(fontSize: 18.0),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          // SEND LOCATION TO PREVIOUS PAGE
                          Navigator.of(context).pop(selectedLatLng);
                        },
                        child: Text("Submit"))
                  ],
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
