import 'package:demographics/chart/animated_horizontal_bar_no_background.dart';
import 'package:demographics/chart/chart_container.dart';
import 'package:demographics/model/chart_data.dart';
import 'package:demographics/utils/dimens.dart';
import 'package:flutter/material.dart';

class HorizontalBarChart1 extends StatelessWidget {
  final String chartName;
  final List<ChartData> data;
  final Color color;

  const HorizontalBarChart1({
    super.key,
    this.chartName = '',
    required this.data,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return ChartContainer(
      chartName: chartName,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: _buildChartBars()),
    );
  }

  _buildChartBars() {
    List<Widget> chartBars = [];
    for (int i = 0; i < this.data.length; i++) {
      AnimatedHorizontalBarNoBackground bar = AnimatedHorizontalBarNoBackground(
        title: this.data[i].name,
        percentages: this.data[i].number,
        color: color,
      );

      chartBars.add(bar);
      chartBars.add(SizedBox(
        height: Dimens.formPaddingMedium,
      ));
    }

    if (chartBars.isNotEmpty) {
      chartBars.removeLast();
    }

    return chartBars;
  }
}
