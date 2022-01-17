import 'package:demographics/chart/chart_container.dart';
import 'package:demographics/utils/colors.dart';
import 'package:demographics/utils/dimens.dart';
import 'package:demographics/utils/ui_utils.dart';
import 'package:flutter/material.dart';

class TopCountryChart extends StatelessWidget {
  final String country;
  final double percentage;

  const TopCountryChart(
      {Key key, @required this.country, @required this.percentage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {

    return ChartContainer(
      chartName: country,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
//          Icon(Images.map, width: getScreenWidth(context)),
          SizedBox(
            height: Dimens.formMarginTop,
          ),
          Text(
            '${this.country} $percentage%',
            style: TextStyle(
                fontSize: Dimens.chartTopCountryTextSize,
                fontWeight: FontWeight.w700,
                color: AppColors.black),
          )
        ],
      ),
    );
  }
}
