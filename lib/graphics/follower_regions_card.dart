import 'package:demographics/chart/horizontal_bar_chart_1.dart';
import 'package:demographics/model/chart_data.dart';
import 'package:demographics/model/region_data.dart';
import 'package:demographics/utils/colors.dart';
import 'package:flutter/material.dart';


class FollowerRegionsCard extends StatelessWidget {
  final List<RegionData> regions;
  final String influencerUsername;
  final Color barColor;

  const FollowerRegionsCard(
      {super.key,
      required this.regions,
      this.barColor = AppColors.primary,
      required this.influencerUsername});

  @override
  Widget build(BuildContext context) {

    List<ChartData> chartData = [];
    regions.forEach((country) {
      chartData.add(ChartData(name: country.name, number: country.value));
    });

    return HorizontalBarChart1(
      chartName: 'Followers region',
      data: chartData,
      color: barColor,
    );
  }
}
