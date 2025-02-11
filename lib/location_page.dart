import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

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
                  if (await isLocationPermissionProvided()) {
                    position = await Geolocator.getCurrentPosition(
                        locationSettings: locationSettings);

                    print(position);
                    setState(() {});
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(15.0)),
                  child: ListTile(
                    leading: Container(
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
              Spacer(),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop(position);
                    },
                    child: Text("Submit")),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
