import 'package:demographics/chart/horizontal_bar_chart_1.dart';
import 'package:demographics/model/chart_data.dart';
import 'package:demographics/model/country_data.dart';
import 'package:demographics/utils/colors.dart';
import 'package:flutter/material.dart';

class FollowerCountriesCard extends StatelessWidget {
  final List<CountryData> countries;
  final String influencerUsername;
  final Color barColor;

  const FollowerCountriesCard(
      {super.key,
      required this.countries,
      this.barColor = AppColors.primary,
      required this.influencerUsername});

  @override
  Widget build(BuildContext context) {
    List<ChartData> chartData = [];
    countries.forEach((country) {
      chartData.add(ChartData(name: country.name, number: country.value));
    });

    return HorizontalBarChart1(
      chartName: 'Followers country',
      data: chartData,
      color: barColor,
    );
  }
}
