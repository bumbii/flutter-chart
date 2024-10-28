import 'package:demographics/chart/horizontal_bar_chart.dart';
import 'package:demographics/model/chart_data.dart';
import 'package:demographics/model/personality.dart';
import 'package:flutter/material.dart';

class FollowerPersonalityCard extends StatelessWidget {
  final List<Personality> personalities;

  const FollowerPersonalityCard({super.key, required this.personalities});

  @override
  Widget build(BuildContext context) {
    List<ChartData> chartData = [];
    personalities.forEach((personality) {
      chartData.add(
          ChartData(name: personality.name, number: personality.value ?? 0));
    });

    return chartData.length == 0
        ? Text("")
        : HorizontalBarChart(
            chartName: 'Followers Personality',
            data: chartData,
            onInfoIconPressed: () {},
          );
  }
}
