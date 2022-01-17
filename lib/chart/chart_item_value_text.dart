import 'package:demographics/utils/colors.dart';
import 'package:demographics/utils/dimens.dart';
import 'package:flutter/material.dart';


class ChartItemValueText extends StatelessWidget {
  final String value;

  const ChartItemValueText({Key key, this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (this.value != null) {
      return Text(
        this.value,
        style: TextStyle(
            color: AppColors.chartItemTextBlack,
            fontSize: Dimens.chartSectionTextSize,
            fontWeight: FontWeight.w900),
      );
    } else {
      return Container();
    }
  }
}
