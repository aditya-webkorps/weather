import 'package:flutter/material.dart';

import '../common/text_styles.dart';
import 'weekly_day_forecast_widget.dart';

class WeeklyForecastWeatherWidget extends StatelessWidget {
  const WeeklyForecastWeatherWidget({super.key, required this.isNightTime});

  final bool isNightTime;

  String _getDayName(int weekday) {
    switch (weekday) {
      case 1:
        return 'Mon';
      case 2:
        return 'Tue';
      case 3:
        return 'Wed';
      case 4:
        return 'Thu';
      case 5:
        return 'Fri';
      case 6:
        return 'Sat';
      case 7:
        return 'Sun';
      default:
        return '';
    }
  }

  String _getFormattedDate(int daysToAdd) {
    final date = DateTime.now().add(Duration(days: daysToAdd));
    return '${_getDayName(date.weekday)}, ${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: EdgeInsets.symmetric(horizontal: 30.0),
      decoration: BoxDecoration(
        color: isNightTime
            ? Color(0xFF001026).withValues(alpha: 0.5)
            : Color(0xFF104084).withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Next Forecast',
                style: TextStyles.boldWhite22,
              ),
              Icon(Icons.calendar_today,
                  color: Colors.white.withValues(alpha: 0.7)),
            ],
          ),
          const SizedBox(height: 16),
          WeeklyDayForecastWidget(
              day: _getFormattedDate(0), maxTemp: '13°C', minTemp: '10°C'),
          const SizedBox(height: 12),
          WeeklyDayForecastWidget(
              day: _getFormattedDate(1), maxTemp: '17°C', minTemp: '12°C'),
          const SizedBox(height: 12),
          WeeklyDayForecastWidget(
              day: _getFormattedDate(2), maxTemp: '19°C', minTemp: '14°C'),
          const SizedBox(height: 12),
          WeeklyDayForecastWidget(
              day: _getFormattedDate(3), maxTemp: '21°C', minTemp: '15°C'),
          const SizedBox(height: 12),
          WeeklyDayForecastWidget(
              day: _getFormattedDate(4), maxTemp: '20°C', minTemp: '13°C'),
          const SizedBox(height: 12),
          WeeklyDayForecastWidget(
              day: _getFormattedDate(5), maxTemp: '20°C', minTemp: '13°C'),
          const SizedBox(height: 12),
          WeeklyDayForecastWidget(
              day: _getFormattedDate(6), maxTemp: '16°C', minTemp: '10°C'),
        ],
      ),
    );
  }
}
