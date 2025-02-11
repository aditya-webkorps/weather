import 'package:flutter/material.dart';

class HourlyForecastColumnItem extends StatelessWidget {
  const HourlyForecastColumnItem({
    super.key,
    required this.time,
    required this.temp,
    this.isCurrent = false,
  });

  final String time;
  final String temp;
  final bool isCurrent;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: isCurrent ? Color(0x332566A3) : Colors.transparent,
        border: Border.all(
            width: isCurrent ? 1 : 0,
            color: isCurrent ? Color(0xFF91DEFF) : Colors.transparent,
            strokeAlign: BorderSide.strokeAlignCenter),
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        children: [
          Text(time,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
              )),
          const SizedBox(height: 16),
          const Icon(Icons.cloud, color: Colors.white, size: 24),
          const SizedBox(height: 16),
          Text(temp,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
              )),
        ],
      ),
    );
  }
}
