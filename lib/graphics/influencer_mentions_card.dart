import 'package:demographics/chart/horizontal_bar_chart_1.dart';
import 'package:demographics/model/chart_data.dart';
import 'package:demographics/model/hash_tag.dart';
import 'package:demographics/utils/colors.dart';
import 'package:demographics/utils/dimens.dart';
import 'package:flutter/material.dart';


class InfluencerMentionsCard extends StatelessWidget {
  final String chartTitle;
  final List<HashTag> mentions;
  final Color barColor;

  const InfluencerMentionsCard(
      {Key key, this.mentions, this.barColor = AppColors.primary, this.chartTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<ChartData> chartData = [];
    if (mentions != null) {
      mentions.forEach((mention) {
        chartData.add(ChartData(name: mention.name, number: mention.value));
      });
    }

    if (chartData.length != 0) {
      return Column(
        children: <Widget>[
          SizedBox(
            height: Dimens.formMarginTop / 2,
          ),
          HorizontalBarChart1(
            chartName: chartTitle ?? 'Mention',
            data: chartData,
            color: barColor,
          )
        ],
      );
    } else {
      return Container();
    }
  }
}
