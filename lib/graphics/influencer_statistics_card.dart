import 'package:demographics/chart/chart_container.dart';
import 'package:demographics/chart/chart_text_item.dart';
import 'package:demographics/utils/dimens.dart';
import 'package:demographics/utils/number_utils.dart';
import 'package:flutter/material.dart';

class InfluencerStatisticsCard extends StatelessWidget {
  final int followers;
  final double suspiciousFollowers;
  final double activeFollowers;
  final double activeFollowersLevels;

  const InfluencerStatisticsCard(
      {super.key,
      this.followers = 0,
      this.suspiciousFollowers = 0,
      this.activeFollowers = 0,
      this.activeFollowersLevels = 0});

  @override
  Widget build(BuildContext context) {
    return ChartContainer(
      chartName: 'Statistics',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: ChartTextItem(
                  title: 'Followers',
                  value: '${convertNumber(this.followers)}',
                ),
              ),
              Expanded(
                child: ChartTextItem(
                  title: 'Suspicious Followers',
                  value: '${this.suspiciousFollowers}%',
                ),
              )
            ],
          ),
          SizedBox(
            height: Dimens.formMarginTop,
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: ChartTextItem(
                  title: 'Active Followers',
                  value: '${this.activeFollowers}%',
                ),
              ),
              Expanded(
                child: ChartTextItem(
                  title: 'Active Followers Levels',
                  value: '${this.activeFollowersLevels}%',
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
