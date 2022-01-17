import 'package:demographics/chart/chart_container.dart';
import 'package:demographics/model/stats_gender.dart';
import 'package:demographics/utils/colors.dart';
import 'package:demographics/utils/dimens.dart';
import 'package:demographics/utils/ui_utils.dart';
import 'package:flutter/material.dart';

class GenderChart extends StatelessWidget {
  final StatsGender statsGender;

  const GenderChart({Key key, @required this.statsGender}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return ChartContainer(
      chartName: 'Gender',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          GenderItem(
              isMale: false, percentage: this.statsGender.femalePercentages),
          SizedBox(height: 10),
          GenderItem(isMale: true, percentage: this.statsGender.malePercentages)
        ],
      ),
    );
  }
}

class GenderItem extends StatefulWidget {
  final bool isMale;
  final num percentage;

  const GenderItem({Key key, this.isMale, this.percentage}) : super(key: key);

  @override
  _GenderItemState createState() => _GenderItemState();
}

class _GenderItemState extends State<GenderItem>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);
    _animation = CurvedAnimation(parent: _controller, curve: Curves.decelerate);

    onWidgetBuildDone(_onBuildDone);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final String gender = widget.isMale ? 'Male' : 'Female';

    final TextStyle textStyle = TextStyle(
        color: widget.isMale
            ? AppColors.genderMaleText
            : AppColors.genderFemaleText,
        fontSize: widget.percentage > 50
            ? Dimens.chartBigSessionTextSize
            : Dimens.chartSmallSectionTextSize,
        fontWeight: FontWeight.w900);

    return Row(
      children: <Widget>[
        Icon(
          Icons.perm_identity,
          size: getScreenWidth(context) / 10,
        ),
        SizedBox(
          width: getScreenWidth(context) / 20,
        ),
        Expanded(
          child: ScaleTransition(
            scale: _animation,
            child: Text(
              '${widget.percentage}% $gender',
              style: textStyle,
            ),
          ),
        )
      ],
    );
  }

  _onBuildDone() async {
    await Future.delayed(Duration(milliseconds: 200));
    _controller.forward();
  }
}
