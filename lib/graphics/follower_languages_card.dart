import 'package:demographics/chart/donut_chart.dart';
import 'package:demographics/chart/followers_text.dart';
import 'package:demographics/model/chart_data.dart';
import 'package:demographics/model/language_data.dart';
import 'package:flutter/material.dart';

class FollowerLanguagesCard extends StatelessWidget {
  final List<LanguageData> languages;
  final String username;
  final int followers;

  const FollowerLanguagesCard(
      {Key key, this.languages, this.username, this.followers = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {

    List<ChartData> chartData = [];
    if (languages != null) {
      languages.forEach((mention) {
        chartData.add(ChartData(name: mention.name, number: mention.value));
      });
    }

    return DonutChart(
      chartName: 'Followers language',
      data: chartData,
      centerWidget: FollowersText(
        followersNumber: this.followers,
      ),
    );
  }
}
