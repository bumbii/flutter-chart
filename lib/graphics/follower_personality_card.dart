import 'package:demographics/chart/horizontal_bar_chart.dart';
import 'package:demographics/model/chart_data.dart';
import 'package:demographics/model/personality.dart';
import 'package:flutter/material.dart';

class FollowerPersonalityCard extends StatelessWidget {
  final List<Personality> personalities;

  const FollowerPersonalityCard({Key key, this.personalities})
      : super(key: key);

  @override
  Widget build(BuildContext context) {

    List<ChartData> chartData = [];
    if (personalities != null) {
      personalities.forEach((personality) {
        chartData
            .add(ChartData(name: personality.name, number: personality.value));
      });
    }

    return chartData.length == 0
        ? Text("")
        : HorizontalBarChart(
            chartName: 'Followers Personality',
            data: chartData,
            onInfoIconPressed: () {

            },
          );
  }

}
