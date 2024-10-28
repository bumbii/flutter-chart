import 'package:demographics/utils/colors.dart';
import 'package:demographics/utils/dimens.dart';
import 'package:flutter/material.dart';

class ChartDataName extends StatelessWidget {
  final Color color;
  final Color textColor;
  final String name;
  final String percentages;

  const ChartDataName(
      {super.key,
      this.color = AppColors.primary,
      required this.name,
      this.textColor = AppColors.white,
      required this.percentages});

  @override
  Widget build(BuildContext context) {
    String label = '${this.name.toUpperCase()}\n$percentages%';
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
      decoration: BoxDecoration(
          color: this.color,
          borderRadius: BorderRadius.all(Radius.circular(5))),
      child: Text(
        label,
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: Dimens.chartDataNameTextSize,
            color: this.textColor,
            fontWeight: FontWeight.w700),
      ),
    );
  }
}
