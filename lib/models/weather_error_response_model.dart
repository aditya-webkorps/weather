// To parse this JSON data, do
//
//     final weatherErrorResponseModel = weatherErrorResponseModelFromJson(jsonString);

import 'dart:convert';

WeatherErrorResponseModel weatherErrorResponseModelFromJson(String str) =>
    WeatherErrorResponseModel.fromJson(json.decode(str));

String weatherErrorResponseModelToJson(WeatherErrorResponseModel data) =>
    json.encode(data.toJson());

class WeatherErrorResponseModel {
  final Error? error;

  WeatherErrorResponseModel({
    this.error,
  });

  factory WeatherErrorResponseModel.fromJson(Map<String, dynamic> json) =>
      WeatherErrorResponseModel(
        error: json["error"] == null ? null : Error.fromJson(json["error"]),
      );

  Map<String, dynamic> toJson() => {
        "error": error?.toJson(),
      };
}

class Error {
  final int? code;
  final String? message;

  Error({
    this.code,
    this.message,
  });

  factory Error.fromJson(Map<String, dynamic> json) => Error(
        code: json["code"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
      };
}
