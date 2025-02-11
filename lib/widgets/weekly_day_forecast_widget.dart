import 'package:flutter/material.dart';

class WeeklyDayForecastWidget extends StatelessWidget {
  const WeeklyDayForecastWidget(
      {super.key,
      required this.day,
      required this.maxTemp,
      required this.minTemp});

  final String day;
  final String maxTemp;
  final String minTemp;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(day,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                )),
          ),
          Expanded(
            child: Row(
              children: [
                const Icon(Icons.water_drop, color: Colors.white, size: 20),
                const SizedBox(width: 8),
                Spacer(),
                Text('$maxTemp  $minTemp',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
