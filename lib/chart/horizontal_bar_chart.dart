import 'package:demographics/chart/animated_horizontal_bar.dart';
import 'package:demographics/chart/chart_container.dart';
import 'package:demographics/model/chart_data.dart';
import 'package:demographics/utils/colors.dart';
import 'package:flutter/material.dart';


class HorizontalBarChart extends StatelessWidget {
  final String chartName;
  final List<ChartData> data;
  final Function onInfoIconPressed;

  const HorizontalBarChart({Key key, this.chartName = '', @required this.data, this.onInfoIconPressed,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChartContainer(
      onInfoIconPressed: this.onInfoIconPressed,
      chartName: chartName,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: _buildChartBars()
      ),
    );
  }

  _buildChartBars() {
    List<Widget> chartBars = [];
    for (int i = 0; i < this.data.length; i++) {
      AnimatedHorizontalBar bar = AnimatedHorizontalBar(
        title: this.data[i].name != null ? this.data[i].name : '',
        width: this.data[i].number != null ? this.data[i].number : 0.0,
        color: AppColors.chartColors[i % AppColors.chartColors.length],
      );

      chartBars.add(bar);
      chartBars.add(SizedBox(height: 10,));
    }

    if (chartBars.isNotEmpty) {
      chartBars.removeLast();
    }

    return chartBars;
  }
}