import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/models/weather_model.dart';

class NetworkService {
  String baseUrl = 'http://api.weatherapi.com/v1/';
  String apiKey = "414ace58f0c6403f9e1164448251002";

  Future<WeatherResponseModel> getForecastData(
      {required double lat, required double long}) async {

    final response = await http.get(
        Uri.parse('${baseUrl}forecast.json?key=$apiKey&q=$lat,$long&days=7'));

    // CONVERT STRING JSON RESPONSE INTO MAP
    Map<String, dynamic> responseMap = json.decode(response.body);

    // FETCH DATA FROM MAP TO WeatherResponseModel
    var responseModel = WeatherResponseModel(
      name: responseMap['location']['name'],
      region: responseMap['location']['region'],
      country: responseMap['location']['country'],
      currentTemp: responseMap['current']['temp_c'],
      maxTemp: responseMap['forecast']['forecastday'][0]['day']['maxtemp_c'],
      minTemp: responseMap['forecast']['forecastday'][0]['day']['mintemp_c'],
      sunrise: responseMap['forecast']['forecastday'][0]['astro']['sunrise'],
      sunset: responseMap['forecast']['forecastday'][0]['astro']['sunset'],
    );

    return responseModel;
  }
}

// MODEL CLASS
class WeatherResponseModel {
  final String name;
  final String region;
  final String country;
  final double currentTemp;
  final double minTemp;
  final double maxTemp;
  final String sunrise;
  final String sunset;

  WeatherResponseModel(
      {required this.name,
      required this.region,
      required this.country,
      required this.currentTemp,
      required this.minTemp,
      required this.maxTemp,
      required this.sunrise,
      required this.sunset});
}
