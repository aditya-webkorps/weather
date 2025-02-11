import 'package:flutter/material.dart';

import 'today_weather_row_item.dart';

class CurrentWeatherWidget extends StatelessWidget {
  const CurrentWeatherWidget({
    super.key,
    required this.isNightTime,
  });

  final bool isNightTime;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 30.0, right: 30, top: 20.0, bottom: 10.0),
      padding: EdgeInsets.symmetric(vertical: 10.0),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: isNightTime
            ? Color(0xFF001026).withValues(alpha: 0.5)
            : Color(0xFF104084).withValues(alpha: 0.3),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TodayWeatherRowItem(
            imagePath: "assets/icons/rain.svg",
            value: '6%',
          ),
          TodayWeatherRowItem(
            imagePath: "assets/icons/humidity.svg",
            value: '90%',
          ),
          TodayWeatherRowItem(
            imagePath: "assets/icons/wind.svg",
            value: '19 km/hr',
          ),
        ],
      ),
    );
  }
}
