import 'package:flutter/material.dart';
import 'package:weather_app/widgets/hourly_forecast_column_item.dart';

import '../common/text_styles.dart';

class HourlyForecastWeatherWidget extends StatelessWidget {
  const HourlyForecastWeatherWidget({super.key, required this.isNightTime});

  final bool isNightTime;

  String _getFormattedDate() {
    final date = DateTime.now();
    final month = _getMonthName(date.month);
    return '$month, ${date.day}';
  }

  String _getMonthName(int month) {
    switch (month) {
      case 1:
        return 'Jan';
      case 2:
        return 'Feb';
      case 3:
        return 'Mar';
      case 4:
        return 'Apr';
      case 5:
        return 'May';
      case 6:
        return 'Jun';
      case 7:
        return 'Jul';
      case 8:
        return 'Aug';
      case 9:
        return 'Sep';
      case 10:
        return 'Oct';
      case 11:
        return 'Nov';
      case 12:
        return 'Dec';
      default:
        return '';
    }
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
                'Today',
                style: TextStyles.boldWhite22,
              ),
              Text(
                _getFormattedDate(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              HourlyForecastColumnItem(
                  time: '15.00', temp: isNightTime ? '29°C' : '31°C'),
              HourlyForecastColumnItem(
                time: '16.00',
                temp: isNightTime ? '26°C' : '30°C',
                isCurrent: true,
              ),
              HourlyForecastColumnItem(
                time: '17.00',
                temp: isNightTime ? '24°C' : '28°C',
                isCurrent: false,
              ),
              HourlyForecastColumnItem(
                  time: '18.00', temp: isNightTime ? '23°C' : '28°C'),
            ],
          ),
          SizedBox(height: 10.0),
        ],
      ),
    );
  }
}
