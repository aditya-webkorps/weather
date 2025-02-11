import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../common/text_styles.dart';

class TodayWeatherRowItem extends StatelessWidget {
  const TodayWeatherRowItem({
    super.key,
    required this.imagePath,
    required this.value,
  });

  final String imagePath;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          imagePath,
          semanticsLabel: 'Location',
          height: 27,
          width: 27,
        ),
        Text(
          value,
          style: TextStyles.regularWhite16,
        ),
      ],
    );
  }
}
