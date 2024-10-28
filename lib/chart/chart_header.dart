import 'package:demographics/utils/colors.dart';
import 'package:demographics/utils/dimens.dart';
import 'package:flutter/material.dart';

class ChartHeader extends StatelessWidget {
  final String chartName;

  const ChartHeader({super.key, required this.chartName});

  @override
  Widget build(BuildContext context) {
    return Text(
      this.chartName,
      style: TextStyle(
          fontSize: Dimens.chartHeaderTextSize,
          fontWeight: FontWeight.w700,
          color: AppColors.black),
    );
    }
}
