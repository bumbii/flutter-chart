import 'package:demographics/utils/colors.dart';
import 'package:demographics/utils/dimens.dart';
import 'package:flutter/material.dart';

class InfluencerGlobalScore extends StatelessWidget {
  final double globalScore;

  const InfluencerGlobalScore({super.key, this.globalScore = 0});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Container(
            padding: EdgeInsets.all(Dimens.formPaddingTiny),
            color: AppColors.dartGrey,
            child: Center(
              child: Text('$globalScore ${this.globalScore}',
                  style: TextStyle(
                      color: AppColors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: Dimens.chartSmallSectionTextSize)),
            ),
          ),
        ),
      ],
    );
  }
}
