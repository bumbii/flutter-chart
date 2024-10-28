import 'package:demographics/utils/colors.dart';
import 'package:demographics/utils/dimens.dart';
import 'package:flutter/material.dart';

class ChartItemValueText extends StatelessWidget {
  final String value;

  const ChartItemValueText({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    return Text(
      this.value,
      style: TextStyle(
          color: AppColors.chartItemTextBlack,
          fontSize: Dimens.chartSectionTextSize,
          fontWeight: FontWeight.w900),
    );
  }
}
