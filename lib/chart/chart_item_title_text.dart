import 'package:demographics/utils/colors.dart';
import 'package:demographics/utils/dimens.dart';
import 'package:flutter/material.dart';

class ChartItemTitleText extends StatelessWidget {
  final String title;

  const ChartItemTitleText({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      this.title,
      style: TextStyle(
          color: AppColors.chartItemTextLightGrey,
          fontSize: Dimens.chartSectionTextSize,
          fontWeight: FontWeight.w900),
    );
  }
}
