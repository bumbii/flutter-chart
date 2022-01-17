import 'package:demographics/chart/horizontal_bar_chart.dart';
import 'package:demographics/model/chart_data.dart';
import 'package:demographics/model/interest_data.dart';
import 'package:demographics/utils/dimens.dart';
import 'package:flutter/material.dart';

class WhatInfluencerPostCard extends StatelessWidget {
  final List<InterestData> interests;
  final String influencerUsername;
  final String title;

  const WhatInfluencerPostCard(
      {Key key, this.interests, this.influencerUsername, this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<ChartData> chartData = [];
    if (interests != null) {
      interests.forEach((interest) {
        chartData.add(ChartData(name: interest.name, number: interest.value));
      });
    }

    if (chartData.length != 0) {
      return Column(
        children: <Widget>[
          SizedBox(
            height: Dimens.formMarginTop / 2,
          ),
          HorizontalBarChart(
            chartName: this.title ?? 'What @$influencerUsername post',
            data: chartData,
          )
        ],
      );
    } else {
      return Container();
    }
  }
}
