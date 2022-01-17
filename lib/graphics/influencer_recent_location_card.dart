import 'package:demographics/chart/chart_container.dart';
import 'package:demographics/chart/chart_text_item.dart';
import 'package:demographics/utils/dimens.dart';
import 'package:flutter/material.dart';

class InfluencerRecentLocationCard extends StatelessWidget {
  final String country;
  final String region;
  final String city;

  const InfluencerRecentLocationCard(
      {Key key, this.country = '', this.region = '', this.city = ''})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildRecentLocation(context);
  }

  _buildRecentLocation(BuildContext context) {

    if (country.isEmpty && region.isEmpty && city.isEmpty) {
      return Container();
    } else {
      return ChartContainer(
        chartName: 'Recent Location',
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _buildCountry('Country'),
            _buildRegionAndCity('Region', 'City')
          ],
        ),
      );
    }
  }

  _buildCountry(String countryTitle) {
    if (country.isEmpty) {
      return Container();
    } else {
      return Column(
         children: <Widget>[
           ChartTextItem(
             title: countryTitle.toUpperCase(),
             value: this.country,
           ),
           SizedBox(
             height: Dimens.formMarginTop,
           ),
         ],
      );
    }
  }

  _buildRegionAndCity(String regionTitle, String cityTitle) {
    return Row(
      children: <Widget>[
        Expanded(
          child: _buildRegion(regionTitle),
        ),
        Expanded(
          child: _buildCity(cityTitle)
        )
      ],
    );
  }

  _buildRegion(String regionTitle) {
    if (country.isEmpty) {
      return Container();
    } else {
      return ChartTextItem(
        title: regionTitle.toUpperCase(),
        value: this.region,
      );
    }
  }

  _buildCity(String cityTitle) {
    if (country.isEmpty) {
      return Container();
    } else {
      return ChartTextItem(
        title: cityTitle.toUpperCase(),
        value: this.city,
      );
    }
  }
}
