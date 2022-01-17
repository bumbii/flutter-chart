import 'package:demographics/utils/colors.dart';
import 'package:demographics/utils/dimens.dart';
import 'package:flutter/material.dart';

class ChartItemTitleText extends StatelessWidget {
  final String title;

  const ChartItemTitleText({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (this.title != null) {
      return Text(
        this.title,
        style: TextStyle(
            color: AppColors.chartItemTextLightGrey,
            fontSize: Dimens.chartSectionTextSize,
            fontWeight: FontWeight.w900),
      );
    } else {
      return Container();
    }
  }
}
