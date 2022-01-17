

import 'package:demographics/utils/dimens.dart';
import 'package:demographics/utils/number_utils.dart';
import 'package:flutter/material.dart';

class FollowersText extends StatelessWidget {
  final int followersNumber;

  const FollowersText({Key key, this.followersNumber}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          convertNumber(followersNumber),
          style: TextStyle(
              fontSize: Dimens.chartTopCountryTextSize,
              fontWeight: FontWeight.w900),
        ),
        Text(
          'Followers',
          style: TextStyle(
              fontSize: Dimens.chartDataNameTextSize,
              fontWeight: FontWeight.w600),
        )
      ],
    );
  }
}
