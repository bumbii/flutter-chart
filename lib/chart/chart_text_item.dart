import 'package:demographics/chart/chart_item_title_text.dart';
import 'package:demographics/chart/chart_item_value_text.dart';
import 'package:demographics/utils/dimens.dart';
import 'package:flutter/material.dart';

class ChartTextItem extends StatelessWidget {
  final String title;
  final String value;

  const ChartTextItem({Key key, this.title = '', this.value = ''})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        ChartItemTitleText(
          title: this.title ?? '',
        ),
        SizedBox(
          height: Dimens.formPaddingTiny,
        ),
        ChartItemValueText(
          value: this.value ?? '',
        )
      ],
    );
  }
}
