import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:weather_app/services/network_service.dart';
import 'package:weather_app/widgets/google_map_page.dart';

import 'common/text_styles.dart';

class LocationPage extends StatefulWidget {
  const LocationPage({super.key});

  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  final TextEditingController _searchController = TextEditingController();
  LocationSettings locationSettings =
      LocationSettings(accuracy: LocationAccuracy.best);
  Position? position;
  bool isLoading = false;

  /// THIS METHOD WILL RETURN THE PERMISSION STATUS
  Future<bool> isLocationPermissionProvided() async {
    late LocationPermission permission;

    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Location permission are denied")));
        return false;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Location permission permanently denied")));
      return false;
    }
    return true;
  }

  Future<bool> isGpsServiceEnabled() async {
    bool isGpsEnabled = false;

    isGpsEnabled = await Geolocator.isLocationServiceEnabled();
    if (!isGpsEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("GPS services are disabled. Please enable the GPS.")));
    }
    return isGpsEnabled;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF29B2DD),
        elevation: 0.0,
        title: Text(
          'Select Location',
          style: TextStyles.boldWhite22.copyWith(fontSize: 30.0),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
          colors: [
            Color(0xFF29B2DD),
            Color(0xFF33AADD),
            Color(0xFF2DC8EA),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [0.0, 0.47, 1.0],
        )),
        child: SafeArea(
          child: Column(
            children: [
              TextField(
                controller: _searchController,
                onChanged: (value) {},
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Search location',
                  hintStyle: TextStyle(color: Colors.white.withOpacity(0.7)),
                  prefixIcon: const Icon(Icons.search, color: Colors.white),
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.2),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 16,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              InkWell(
                onTap: () async {
                  isLoading = true;
                  setState(() {});
                  if (await isGpsServiceEnabled()) {
                    if (await isLocationPermissionProvided()) {
                      position = await Geolocator.getCurrentPosition(
                          locationSettings: locationSettings);
                      isLoading = false;
                      setState(() {});
                    }
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(15.0)),
                  child: ListTile(
                    leading: isLoading
                        ? CircularProgressIndicator(color: Colors.white)
                        : Container(
                            padding: EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white.withValues(alpha: 0.3)),
                            child: Icon(
                              Icons.my_location,
                              color: Colors.white,
                            ),
                          ),
                    title: Text(
                      "Current Location",
                      style: TextStyles.semiboldWhite20,
                    ),
                    subtitle: Text(
                      "Using GPS",
                      style: TextStyles.regularWhite16
                          .copyWith(color: Colors.black45),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Lat : ${position?.latitude ?? ''}",
                    style: TextStyles.regularWhite20,
                  ),
                  Text(
                    "Long: ${position?.longitude ?? ''}",
                    style: TextStyles.regularWhite20,
                  ),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              InkWell(
                onTap: () async {
                  LatLng? selectedPosition = await Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => GoogleMapPage())) as LatLng?;

                  if (selectedPosition != null) {
                    callWeatherApi(
                        selectedPosition.latitude, selectedPosition.longitude);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("Please select valid location")));
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(15.0)),
                  child: ListTile(
                    leading: isLoading
                        ? CircularProgressIndicator(color: Colors.white)
                        : Container(
                            padding: EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white.withValues(alpha: 0.3)),
                            child: Icon(
                              Icons.map_rounded,
                              color: Colors.white,
                            ),
                          ),
                    title: Text(
                      "Map Location",
                      style: TextStyles.semiboldWhite20,
                    ),
                    subtitle: Text(
                      "Using Google Map",
                      style: TextStyles.regularWhite16
                          .copyWith(color: Colors.black45),
                    ),
                  ),
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: ElevatedButton(
                    onPressed: () async {
                      callWeatherApi(position?.latitude, position?.longitude);
                    },
                    child: Text("Submit")),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void callWeatherApi(double? latitude, double? longitude) async {
    try {
      NetworkService networkService = NetworkService();

      var responseModel = await networkService.getForecastData(
        lat: latitude,
        long: longitude,
        userInputLocation: _searchController.text,
      );

      if (responseModel.error != null) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("${responseModel.error?.message}")));
      } else {
        Navigator.of(context).pop(responseModel);
      }
    } catch (ex) {
      debugPrint(ex.toString());

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
              "Something went wrong. Our backend team is working on it.")));
    }
  }
}
