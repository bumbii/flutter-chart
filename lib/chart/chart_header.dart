import 'package:demographics/utils/colors.dart';
import 'package:demographics/utils/dimens.dart';
import 'package:flutter/material.dart';

class ChartHeader extends StatelessWidget {
  final String chartName;

  const ChartHeader({Key key, this.chartName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (this.chartName != null) {
      return Text(
        this.chartName,
        style: TextStyle(
            fontSize: Dimens.chartHeaderTextSize,
            fontWeight: FontWeight.w700,
            color: AppColors.black),
      );
    } else {
      return Container();
    }
  }
}
