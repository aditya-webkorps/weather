import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/common/text_styles.dart';
import 'package:weather_app/location_page.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/widgets/hourly_forecast_weather_widget.dart';
import 'package:weather_app/widgets/weekly_forecast_weather_widget.dart';

import 'services/network_service.dart';
import 'widgets/today_weather_row_item.dart';
import 'widgets/today_weather_row_widget.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  bool isNotificationEnabled = true;
  WeatherModel? weatherResponse;

  bool get isNightTime {
    final currentHour = DateTime.now().hour;
    bool isNight = currentHour < 6 || currentHour > 18;
    return isNight;
  }

  @override
  void initState() {
    super.initState();

    // 1. GET SAVED LOCATION - (LAT, LONG)

    // 2. CALL THE WEATHER API
    getWeatherApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: isNightTime
                  ? [
                      Color(0xFF08244F),
                      Color(0xFF134CB5),
                      Color(0xFF0B42AB),
                    ]
                  : [
                      Color(0xFF29B2DD),
                      Color(0xFF33AADD),
                      Color(0xFF2DC8EA),
                    ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [0.0, 0.47, 1.0]),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                /// FIRST ROW, LOCATION, NOTIFICATION
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      /// LOCATION
                      InkWell(
                        onTap: () async {
                          // GET THE RESPONSE MODEL FROM LOCATION PAGE
                          weatherResponse = await Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (context) => LocationPage()))
                              as WeatherModel?;

                          if (weatherResponse != null) {
                            // IF LOCATION RESPONSE IS NOT NULL THEN UPDATE THE UI
                            setState(() {});
                          }
                        },
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              "assets/icons/map.svg",
                              semanticsLabel: 'Location',
                              height: 27,
                              width: 27,
                            ),
                            SizedBox(width: 5.0),
                            Text(
                              '${weatherResponse?.location?.name ?? 'Select Location'}, ${weatherResponse?.location?.region ?? ''}',
                              style: TextStyles.semiboldWhite20,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Icon(
                                Icons.keyboard_arrow_down_rounded,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),

                      /// NOTIFICATION
                      SvgPicture.asset(
                        isNotificationEnabled
                            ? "assets/icons/notification_filled.svg"
                            : "assets/icons/notification_clear.svg",
                        semanticsLabel: 'Location',
                        height: 27,
                        width: 29,
                      ),
                    ],
                  ),
                ),

                /// CLOUD STATUS
                // Icon(
                //   FontAwesomeIcons.cloudSunRain,
                //   color: Colors.white,
                //   size: 130.0,
                // ),

                Image.network(
                  "http:${weatherResponse?.current?.condition?.icon}",
                  width: 130,
                  height: 130,
                  fit: BoxFit.fitHeight,
                ),

                SizedBox(
                  height: 30.0,
                ),

                /// CURRENT TEMPERATURE
                Text("${weatherResponse?.current?.tempC ?? '--'}°",
                    style: TextStyles.semiboldWhite68),

                /// Precipitations
                Text(
                  'Precipitations',
                  style: TextStyles.regularWhite20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Max.:${weatherResponse?.forecast?.forecastday?[0].day?.maxtempC ?? '--'}°',
                      style: TextStyles.regularWhite20,
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      'Min.:${weatherResponse?.forecast?.forecastday?[0].day?.mintempC ?? '--'}°',
                      style: TextStyles.regularWhite20,
                    )
                  ],
                ),

                /// TODAY WEATHER
                CurrentWeatherWidget(
                    isNightTime: isNightTime, model: weatherResponse),

                SizedBox(
                  height: 10.0,
                ),

                /// HOURLY FORECAST
                HourlyForecastWeatherWidget(
                    isNightTime: isNightTime, model: weatherResponse),

                SizedBox(
                  height: 20.0,
                ),

                /// WEEKLY FORECAST
                WeeklyForecastWeatherWidget(
                  isNightTime: isNightTime,
                  weather: weatherResponse,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> getWeatherApi() async {
    // 1. CREATE OBJECT OF NETWORK SERVICE
    NetworkService networkService = NetworkService();

    var response =
        await networkService.getForecastData(lat: 12.9898, long: 34.8787);

    if (response.current != null) {
      weatherResponse = response;

      setState(() {});
    }
  }
}
