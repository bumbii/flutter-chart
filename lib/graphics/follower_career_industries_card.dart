import 'package:demographics/chart/horizontal_bar_chart_1.dart';
import 'package:demographics/model/chart_data.dart';
import 'package:demographics/model/industry_data.dart';
import 'package:demographics/utils/colors.dart';
import 'package:flutter/material.dart';

class FollowerCareerIndustriesCard extends StatelessWidget {
  final List<IndustryData> industries;
  final Color barColor;
  final String influencerUsername;

  const FollowerCareerIndustriesCard(
      {super.key,
      required this.industries,
      this.barColor = AppColors.primary,
      required this.influencerUsername});

  @override
  Widget build(BuildContext context) {

    List<ChartData> chartData = [];
    industries.forEach((mention) {
      chartData.add(ChartData(name: mention.name, number: mention.value));
    });

    return HorizontalBarChart1(
      chartName: 'Industry',
      data: chartData,
      color: barColor,
    );
  }
}
