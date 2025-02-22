import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/connectivity_service.dart';

class NetworkService {
  String baseUrl = 'http://api.weatherapi.com/v1/';
  String apiKey = "414ace58f0c6403f9e1164448251002";

  final ConnectivityService _connectivityService = ConnectivityService();

  Future<bool> _checkInternetConnectivity() async {
    final hasConnection =
        await _connectivityService.checkInternetConnectivity();

    if (!hasConnection) {
      return false;
    }
    return true;
  }

  Future<WeatherModel> getForecastData(
      {double? lat, double? long, String? userInputLocation}) async {
    debugPrint(apiKey);

    String q = "";
    if (userInputLocation != null && userInputLocation.isNotEmpty) {
      q = userInputLocation;
    } else if (lat != null) {
      q = "$lat,$long";
    }

    if (await _checkInternetConnectivity()) {
      final response = await http
          .get(Uri.parse('${baseUrl}forecast.json?key=$apiKey&q=$q&days=8'));

      // CONVERT STRING JSON RESPONSE INTO MAP
      Map<String, dynamic> jsonMap = json.decode(response.body);

      WeatherModel model = WeatherModel.fromJson(jsonMap);
      return model;
    } else {
      return Future.value(
        WeatherModel(
          error: WeatherError(
              code: 1001, message: "Internet connectivity not available..."),
        ),
      );
    }
  }
}
