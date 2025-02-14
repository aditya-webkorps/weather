// To parse this JSON data, do
//
//     final weatherModel = weatherModelFromJson(jsonString);

import 'dart:convert';

WeatherModel weatherModelFromJson(String str) =>
    WeatherModel.fromJson(json.decode(str));

String weatherModelToJson(WeatherModel data) => json.encode(data.toJson());

class WeatherModel {
  // final Location? location;
  final Current? current;

  // final Forecast? forecast;

  WeatherModel({
    // this.location,
    this.current,
    // this.forecast,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) => WeatherModel(
        // location: json["location"] == null
        //     ? null
        //     : Location.fromJson(json["location"]),
        current:
            json["current"] == null ? null : Current.fromJson(json["current"]),
        // forecast: json["forecast"] == null
        //     ? null
        //     : Forecast.fromJson(json["forecast"]),
      );

  Map<String, dynamic> toJson() => {
        // "location": location?.toJson(),
        "current": current?.toJson(),
        // "forecast": forecast?.toJson(),
      };
}

class Current {
  // final String? lastUpdated;
  final double? tempC;

  // final double? tempF;
  // final double? isDay;
  // final Condition? condition;
  // final double? windMph;
  final double? windKph;
  // final double? windDegree;
  // final String? windDir;
  // final double? pressureMb;
  // final double? pressureIn;
  // final double? precipMm;
  // final double? precipIn;
  // final double? humidity;
  // final double? cloud;
  // final double? feelslikeC;
  // final double? feelslikeF;
  // final double? windchillC;
  // final double? windchillF;
  // final double? heatindexC;
  // final double? heatindexF;
  // final double? dewpodoubleC;
  // final double? dewpodoubleF;
  // final double? visKm;
  // final double? visMiles;
  // final double? uv;
  // final double? gustMph;
  // final double? gustKph;
  // final double? timeEpoch;
  // final String? time;
  // final double? snowCm;
  // final double? willItRain;
  // final double? chanceOfRain;
  // final double? willItSnow;
  // final double? chanceOfSnow;

  Current({
    // this.lastUpdatedEpoch,
    // this.lastUpdated,
    this.tempC,
    // this.tempF,
    // this.isDay,
    // this.condition,
    // this.windMph,
    this.windKph,
    // this.windDegree,
    // this.windDir,
    // this.pressureMb,
    // this.pressureIn,
    // this.precipMm,
    // this.precipIn,
    // this.humidity,
    // this.cloud,
    // this.feelslikeC,
    // this.feelslikeF,
    // this.windchillC,
    // this.windchillF,
    // this.heatindexC,
    // this.heatindexF,
    // this.dewpodoubleC,
    // this.dewpodoubleF,
    // this.visKm,
    // this.visMiles,
    // this.uv,
    // this.gustMph,
    // this.gustKph,
    // this.timeEpoch,
    // this.time,
    // this.snowCm,
    // this.willItRain,
    // this.chanceOfRain,
    // this.willItSnow,
    // this.chanceOfSnow,
  });

  factory Current.fromJson(Map<String, dynamic> json) => Current(
        // lastUpdatedEpoch: json["last_updated_epoch"],
        // lastUpdated: json["last_updated"],
        tempC: json["temp_c"]?.toDouble(),
        // tempF: json["temp_f"]?.toDouble(),
        // isDay: json["is_day"],
        // condition: json["condition"] == null ? null : Condition.fromJson(json["condition"]),
        // windMph: json["wind_mph"]?.toDouble(),
        windKph: json["wind_kph"]?.toDouble(),
        // windDegree: json["wind_degree"],
        // windDir: json["wind_dir"],
        // pressureMb: json["pressure_mb"],
        // pressureIn: json["pressure_in"]?.toDouble(),
        // precipMm: json["precip_mm"],
        // precipIn: json["precip_in"],
        // humidity: json["humidity"],
        // cloud: json["cloud"],
        // feelslikeC: json["feelslike_c"]?.toDouble(),
        // feelslikeF: json["feelslike_f"]?.toDouble(),
        // windchillC: json["windchill_c"]?.toDouble(),
        // windchillF: json["windchill_f"]?.toDouble(),
        // heatindexC: json["heatindex_c"]?.toDouble(),
        // heatindexF: json["heatindex_f"]?.toDouble(),
        // dewpodoubleC: json["dewpodouble_c"]?.toDouble(),
        // dewpodoubleF: json["dewpodouble_f"]?.toDouble(),
        // visKm: json["vis_km"],
        // visMiles: json["vis_miles"],
        // uv: json["uv"]?.toDouble(),
        // gustMph: json["gust_mph"]?.toDouble(),
        // gustKph: json["gust_kph"]?.toDouble(),
        // timeEpoch: json["time_epoch"],
        // time: json["time"],
        // snowCm: json["snow_cm"],
        // willItRain: json["will_it_rain"],
        // chanceOfRain: json["chance_of_rain"],
        // willItSnow: json["will_it_snow"],
        // chanceOfSnow: json["chance_of_snow"],
      );

  Map<String, dynamic> toJson() => {
        // "last_updated_epoch": lastUpdatedEpoch,
        // "last_updated": lastUpdated,
        "temp_c": tempC,
        // "temp_f": tempF,
        // "is_day": isDay,
        // "condition": condition?.toJson(),
        // "wind_mph": windMph,
        "wind_kph": windKph,
        // "wind_degree": windDegree,
        // "wind_dir": windDir,
        // "pressure_mb": pressureMb,
        // "pressure_in": pressureIn,
        // "precip_mm": precipMm,
        // "precip_in": precipIn,
        // "humidity": humidity,
        // "cloud": cloud,
        // "feelslike_c": feelslikeC,
        // "feelslike_f": feelslikeF,
        // "windchill_c": windchillC,
        // "windchill_f": windchillF,
        // "heatindex_c": heatindexC,
        // "heatindex_f": heatindexF,
        // "dewpodouble_c": dewpodoubleC,
        // "dewpodouble_f": dewpodoubleF,
        // "vis_km": visKm,
        // "vis_miles": visMiles,
        // "uv": uv,
        // "gust_mph": gustMph,
        // "gust_kph": gustKph,
        // "time_epoch": timeEpoch,
        // "time": time,
        // "snow_cm": snowCm,
        // "will_it_rain": willItRain,
        // "chance_of_rain": chanceOfRain,
        // "will_it_snow": willItSnow,
        // "chance_of_snow": chanceOfSnow,
      };
}

class Condition {
  final Text? text;
  final Icon? icon;
  final double? code;

  Condition({
    this.text,
    this.icon,
    this.code,
  });

  factory Condition.fromJson(Map<String, dynamic> json) => Condition(
        text: textValues.map[json["text"]]!,
        icon: iconValues.map[json["icon"]]!,
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "text": textValues.reverse[text],
        "icon": iconValues.reverse[icon],
        "code": code,
      };
}

enum Icon {
  CDN_WEATHERAPI_COM_WEATHER_64_X64_DAY_113_PNG,
  CDN_WEATHERAPI_COM_WEATHER_64_X64_NIGHT_113_PNG
}

final iconValues = EnumValues({
  "//cdn.weatherapi.com/weather/64x64/day/113.png":
      Icon.CDN_WEATHERAPI_COM_WEATHER_64_X64_DAY_113_PNG,
  "//cdn.weatherapi.com/weather/64x64/night/113.png":
      Icon.CDN_WEATHERAPI_COM_WEATHER_64_X64_NIGHT_113_PNG
});

enum Text { CLEAR, SUNNY }

final textValues = EnumValues({"Clear ": Text.CLEAR, "Sunny": Text.SUNNY});

class Forecast {
  final List<Forecastday>? forecastday;

  Forecast({
    this.forecastday,
  });

  factory Forecast.fromJson(Map<String, dynamic> json) => Forecast(
        forecastday: json["forecastday"] == null
            ? []
            : List<Forecastday>.from(
                json["forecastday"]!.map((x) => Forecastday.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "forecastday": forecastday == null
            ? []
            : List<dynamic>.from(forecastday!.map((x) => x.toJson())),
      };
}

class Forecastday {
  final DateTime? date;
  final double? dateEpoch;
  final Day? day;
  final Astro? astro;
  final List<Current>? hour;

  Forecastday({
    this.date,
    this.dateEpoch,
    this.day,
    this.astro,
    this.hour,
  });

  factory Forecastday.fromJson(Map<String, dynamic> json) => Forecastday(
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        dateEpoch: json["date_epoch"],
        day: json["day"] == null ? null : Day.fromJson(json["day"]),
        astro: json["astro"] == null ? null : Astro.fromJson(json["astro"]),
        hour: json["hour"] == null
            ? []
            : List<Current>.from(json["hour"]!.map((x) => Current.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "date":
            "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
        "date_epoch": dateEpoch,
        "day": day?.toJson(),
        "astro": astro?.toJson(),
        "hour": hour == null
            ? []
            : List<dynamic>.from(hour!.map((x) => x.toJson())),
      };
}

class Astro {
  final String? sunrise;
  final String? sunset;
  final String? moonrise;
  final String? moonset;
  final String? moonPhase;
  final double? moonIllumination;
  final double? isMoonUp;
  final double? isSunUp;

  Astro({
    this.sunrise,
    this.sunset,
    this.moonrise,
    this.moonset,
    this.moonPhase,
    this.moonIllumination,
    this.isMoonUp,
    this.isSunUp,
  });

  factory Astro.fromJson(Map<String, dynamic> json) => Astro(
        sunrise: json["sunrise"],
        sunset: json["sunset"],
        moonrise: json["moonrise"],
        moonset: json["moonset"],
        moonPhase: json["moon_phase"],
        moonIllumination: json["moon_illumination"],
        isMoonUp: json["is_moon_up"],
        isSunUp: json["is_sun_up"],
      );

  Map<String, dynamic> toJson() => {
        "sunrise": sunrise,
        "sunset": sunset,
        "moonrise": moonrise,
        "moonset": moonset,
        "moon_phase": moonPhase,
        "moon_illumination": moonIllumination,
        "is_moon_up": isMoonUp,
        "is_sun_up": isSunUp,
      };
}

class Day {
  final double? maxtempC;
  final double? maxtempF;
  final double? mdoubleempC;
  final double? mdoubleempF;
  final double? avgtempC;
  final double? avgtempF;
  final double? maxwindMph;
  final double? maxwindKph;
  final double? totalprecipMm;
  final double? totalprecipIn;
  final double? totalsnowCm;
  final double? avgvisKm;
  final double? avgvisMiles;
  final double? avghumidity;
  final double? dailyWillItRain;
  final double? dailyChanceOfRain;
  final double? dailyWillItSnow;
  final double? dailyChanceOfSnow;
  final Condition? condition;
  final double? uv;

  Day({
    this.maxtempC,
    this.maxtempF,
    this.mdoubleempC,
    this.mdoubleempF,
    this.avgtempC,
    this.avgtempF,
    this.maxwindMph,
    this.maxwindKph,
    this.totalprecipMm,
    this.totalprecipIn,
    this.totalsnowCm,
    this.avgvisKm,
    this.avgvisMiles,
    this.avghumidity,
    this.dailyWillItRain,
    this.dailyChanceOfRain,
    this.dailyWillItSnow,
    this.dailyChanceOfSnow,
    this.condition,
    this.uv,
  });

  factory Day.fromJson(Map<String, dynamic> json) => Day(
        maxtempC: json["maxtemp_c"]?.toDouble(),
        maxtempF: json["maxtemp_f"]?.toDouble(),
        mdoubleempC: json["mdoubleemp_c"]?.toDouble(),
        mdoubleempF: json["mdoubleemp_f"]?.toDouble(),
        avgtempC: json["avgtemp_c"]?.toDouble(),
        avgtempF: json["avgtemp_f"]?.toDouble(),
        maxwindMph: json["maxwind_mph"]?.toDouble(),
        maxwindKph: json["maxwind_kph"]?.toDouble(),
        totalprecipMm: json["totalprecip_mm"],
        totalprecipIn: json["totalprecip_in"],
        totalsnowCm: json["totalsnow_cm"],
        avgvisKm: json["avgvis_km"],
        avgvisMiles: json["avgvis_miles"],
        avghumidity: json["avghumidity"],
        dailyWillItRain: json["daily_will_it_rain"],
        dailyChanceOfRain: json["daily_chance_of_rain"],
        dailyWillItSnow: json["daily_will_it_snow"],
        dailyChanceOfSnow: json["daily_chance_of_snow"],
        condition: json["condition"] == null
            ? null
            : Condition.fromJson(json["condition"]),
        uv: json["uv"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "maxtemp_c": maxtempC,
        "maxtemp_f": maxtempF,
        "mdoubleemp_c": mdoubleempC,
        "mdoubleemp_f": mdoubleempF,
        "avgtemp_c": avgtempC,
        "avgtemp_f": avgtempF,
        "maxwind_mph": maxwindMph,
        "maxwind_kph": maxwindKph,
        "totalprecip_mm": totalprecipMm,
        "totalprecip_in": totalprecipIn,
        "totalsnow_cm": totalsnowCm,
        "avgvis_km": avgvisKm,
        "avgvis_miles": avgvisMiles,
        "avghumidity": avghumidity,
        "daily_will_it_rain": dailyWillItRain,
        "daily_chance_of_rain": dailyChanceOfRain,
        "daily_will_it_snow": dailyWillItSnow,
        "daily_chance_of_snow": dailyChanceOfSnow,
        "condition": condition?.toJson(),
        "uv": uv,
      };
}

class Location {
  final String? name;
  final String? region;
  final String? country;
  final double? lat;
  final double? lon;
  final String? tzId;
  final String? localtime;

  Location({
    this.name,
    this.region,
    this.country,
    this.lat,
    this.lon,
    this.tzId,
    this.localtime,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        name: json["name"],
        region: json["region"],
        country: json["country"],
        lat: json["lat"]?.toDouble(),
        lon: json["lon"]?.toDouble(),
        tzId: json["tz_id"],
        localtime: json["localtime"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "region": region,
        "country": country,
        "lat": lat,
        "lon": lon,
        "tz_id": tzId,
        "localtime": localtime,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
