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
      {super.key,
      required this.interests,
      required this.influencerUsername,
      this.title = 'Post'});

  @override
  Widget build(BuildContext context) {
    List<ChartData> chartData = [];
    interests.forEach((interest) {
      chartData.add(ChartData(name: interest.name, number: interest.value));
    });

    if (chartData.length != 0) {
      return Column(
        children: <Widget>[
          SizedBox(
            height: Dimens.formMarginTop / 2,
          ),
          HorizontalBarChart(
            chartName: this.title,
            data: chartData,
          )
        ],
      );
    } else {
      return Container();
    }
  }
}
