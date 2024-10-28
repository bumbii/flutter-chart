import 'package:demographics/chart/horizontal_bar_chart_1.dart';
import 'package:demographics/model/chart_data.dart';
import 'package:demographics/model/city_data.dart';
import 'package:demographics/utils/colors.dart';
import 'package:flutter/material.dart';

class FollowerCitiesCard extends StatelessWidget {
  final List<CityData> cities;
  final String influencerUsername;
  final Color barColor;

  const FollowerCitiesCard(
      {super.key,
      required this.cities,
      this.barColor = AppColors.primary,
      required this.influencerUsername});

  @override
  Widget build(BuildContext context) {

    List<ChartData> chartData = [];
    cities.forEach((city) {
      chartData.add(ChartData(name: city.name, number: city.value));
    });

    return HorizontalBarChart1(
      chartName: 'Followers city',
      data: chartData,
      color: barColor,
    );
  }
}
