import 'package:demographics/chart/pie_chart.dart';
import 'package:demographics/model/chart_data.dart';
import 'package:flutter/material.dart';

class InfluencerSentimentDistributionCard extends StatelessWidget {
  final num low;
  final num medium;
  final num high;

  const InfluencerSentimentDistributionCard(
      {Key key, this.low, this.medium, this.high})
      : super(key: key);

  @override
  Widget build(BuildContext context) {

    List<ChartData> chartData = [];
    chartData.add(ChartData(name: 'Low', number: this.low, isHighlighted: true));
    chartData.add(ChartData(name: 'Medium', number: this.medium, isHighlighted: false));
    chartData.add(ChartData(name: 'High', number: this.high, isHighlighted: false));

    num topValue = 0;
    int position = 0;
    for (int i = 0; i < chartData.length; i++) {
      if (chartData[i].number > topValue) {
        topValue = chartData[i].number;
        position = i;
      }
    }
    ChartData updateDataHighlight = chartData[position];
    String name = updateDataHighlight.name;
    num value = updateDataHighlight.number;
    chartData.removeAt(position);
    chartData.insert(position, ChartData(name: name, number: value, isHighlighted: true));

    return PieChart(
      chartName: 'Sentiment Distribution',
      data: chartData,
    );
  }

}
