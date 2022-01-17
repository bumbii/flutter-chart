import 'package:demographics/utils/colors.dart';
import 'package:demographics/utils/dimens.dart';
import 'package:flutter/material.dart';

class ChartItemValueTextWithBackground extends StatelessWidget {
  final String value;
  final Color backgroundColor;
  final Color texColor;

  const ChartItemValueTextWithBackground(
      {Key key, this.value, this.backgroundColor, this.texColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (this.value != null) {
      return Container(
        padding: EdgeInsets.symmetric(
            horizontal: Dimens.formPaddingSmall,
            vertical: Dimens.formPaddingTiny),
        color: this.backgroundColor ?? AppColors.chartItemBackground,
        child: Text(
          this.value,
          style: TextStyle(
              color: this.texColor ?? AppColors.white,
              fontSize: Dimens.chartSectionTextSize,
              fontWeight: FontWeight.w900),
        ),
      );
    } else {
      return Container();
    }
  }
}
