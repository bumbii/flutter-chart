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
      {Key key,
      this.cities,
      this.barColor = AppColors.primary,
      this.influencerUsername})
      : super(key: key);

  @override
  Widget build(BuildContext context) {

    List<ChartData> chartData = [];
    if (cities != null) {
      cities.forEach((city) {
        chartData.add(ChartData(name: city.name, number: city.value));
      });
    }

    return HorizontalBarChart1(
      chartName: 'Followers city',
      data: chartData,
      color: barColor,
    );
  }
}
