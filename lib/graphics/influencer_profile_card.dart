import 'package:demographics/chart/chart_container.dart';
import 'package:demographics/chart/chart_item_title_text.dart';
import 'package:demographics/chart/chart_item_value_text_with_background.dart';
import 'package:demographics/demo_graphics_screen.dart';
import 'package:demographics/model/personality.dart';
import 'package:demographics/utils/dimens.dart';
import 'package:flutter/material.dart';

class InfluencerProfileCard extends StatelessWidget {
  final List<Personality> personalities;
  final List<Language> languages;

  const InfluencerProfileCard({Key key, this.personalities, this.languages})
      : super(key: key);

  @override
  Widget build(BuildContext context) {

    return ChartContainer(
      chartName: 'Profile',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ChartItemTitleText(
            title:'Personality.',
          ),
          SizedBox(
            height: Dimens.formPaddingTiny,
          ),
          _buildPersonalities(),
          SizedBox(
            height: Dimens.formPaddingMedium,
          ),
          ChartItemTitleText(
            title: 'Languages',
          ),
          SizedBox(
            height: Dimens.formPaddingTiny,
          ),
          _buildLanguages()
        ],
      ),
    );
  }

  _buildPersonalities() {
    if (this.personalities != null && this.personalities.length != 0) {
      List<Widget> children = [];
      this.personalities.forEach((personality) {
        children.add(ChartItemValueTextWithBackground(
          value: personality.name.toUpperCase(),
        ));
      });
      return Wrap(
        children: children,
        spacing: Dimens.formPaddingSmall,
        runSpacing: Dimens.formPaddingSmall,
      );
    }
    return Container();
  }

  _buildLanguages() {
    if (this.languages != null && this.languages.length != 0) {
      List<Widget> children = [];
      this.languages.forEach((language) {
        children.add(ChartItemValueTextWithBackground(
          value: language.name.toUpperCase(),
        ));
      });
      return Wrap(
        children: children,
        spacing: Dimens.formPaddingSmall,
        runSpacing: Dimens.formPaddingSmall,
      );
    }
    return Container();
  }
}
