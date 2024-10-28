import 'package:demographics/utils/colors.dart';
import 'package:demographics/utils/dimens.dart';
import 'package:flutter/material.dart';

class ChartItemValueTextWithBackground extends StatelessWidget {
  final String value;
  final Color backgroundColor;
  final Color texColor;

  const ChartItemValueTextWithBackground(
      {super.key,
      required this.value,
      this.backgroundColor = AppColors.chartItemBackground,
      this.texColor = AppColors.white});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: Dimens.formPaddingSmall,
          vertical: Dimens.formPaddingTiny),
      color: this.backgroundColor,
      child: Text(
        this.value,
        style: TextStyle(
            color: this.texColor,
            fontSize: Dimens.chartSectionTextSize,
            fontWeight: FontWeight.w900),
      ),
    );
  }
}
