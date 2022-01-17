import 'dart:math';
import 'dart:ui';

import 'package:demographics/chart/chart_container.dart';
import 'package:demographics/chart/chart_data_name.dart';
import 'package:demographics/model/chart_data.dart';
import 'package:demographics/utils/colors.dart';
import 'package:demographics/utils/dimens.dart';
import 'package:demographics/utils/number_utils.dart';
import 'package:demographics/utils/ui_utils.dart';
import 'package:flutter/material.dart';


class PieChart extends StatefulWidget {
  final String chartName;
  final double radius;
  final List<ChartData> data;

  const PieChart({Key key, this.chartName, @required this.data, this.radius})
      : super(key: key);

  @override
  _PieChartState createState() => _PieChartState();
}

class _PieChartState extends State<PieChart>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1500));
    _animation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
        parent: _animationController, curve: Curves.easeOutSine));
    _animationController.addListener(() {
      setState(() {});
    });

    onWidgetBuildDone(_onBuildDone);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double radius =
        widget.radius != null ? widget.radius : getScreenWidth(context) * 0.375;

    return ChartContainer(
      chartName: this.widget.chartName,
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(Dimens.formMarginTop),
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Container(
                  width: getScreenWidth(context),
                  height: radius * 2,
                  child: CustomPaint(
                    foregroundPainter: PieChatPainter(widget.data,
                        radius: radius, animation: _animation),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: Dimens.formMarginTop),
          Wrap(
            alignment: WrapAlignment.center,
            children: _buildChartDataNames(),
            spacing: 8,
            runSpacing: 8,
          )
        ],
      ),
    );
  }

  _buildChartDataNames() {
    List<Widget> chartDataNames = [];
    if (widget.data != null && widget.data.length > 0) {
      int colorIndex = 0;
      widget.data.forEach((chartData) {
        ChartDataName chartDataName = ChartDataName(
          name: chartData.name,
          percentages: '${convertToPercent(chartData.number)}',
          color: AppColors.chartColors[colorIndex++],
        );

        chartDataNames.add(chartDataName);
      });

      return chartDataNames;
    }
    return [Container()];
  }

  _onBuildDone() async {
    await Future.delayed(Duration(milliseconds: 200));
    _animationController.forward();
  }
}

class PieChatPainter extends CustomPainter {
  final double radius;
  final List<ChartData> data;
  final Animation animation;

  PieChatPainter(this.data, {this.radius, this.animation});

  @override
  void paint(Canvas canvas, Size size) {
    if (this.data != null) {
      int colorIndex = 1;
      Paint paint = Paint()
        ..color = AppColors.chartColors[colorIndex]
        ..style = PaintingStyle.fill;

      Offset center = Offset(size.width / 2, size.height / 2);

      /// Highlighted part will be always drawn as the first "pie"
      double highlightedStartAngle = -pi / 2;

      /// Find the highlighted part
      ChartData highlightedData = data.firstWhere(
          (ChartData chartData) => chartData.isHighlighted,
          orElse: () => data[0]);
      double highlightedSweepAngle = 2 * pi * highlightedData.number - pi / 40;

      /// Find the start angle of second part
      double startAngle = highlightedStartAngle + highlightedSweepAngle;
      double totalSweepAngle = 0;
      double currentSweepAngle = 0;

      this.data.forEach((ChartData chartData) {
        if (!chartData.isHighlighted) {
          /// Calculate sweep angle, subtract {pi / 100} to make a small spaces between 2 parts
          totalSweepAngle = 2 * pi * chartData.number;
          currentSweepAngle = totalSweepAngle * animation.value + pi / 40;

          canvas.drawArc(Rect.fromCircle(center: center, radius: radius),
              startAngle, currentSweepAngle, true, paint);

          /// Calculate new start angle, add {pi / 100} to make a small space between 2 parts
          startAngle += totalSweepAngle;
          paint.color = AppColors.chartColors[++colorIndex];
        }
      });

      /// Draw center white circle
      paint.color = AppColors.white;
      canvas.drawCircle(center, radius / 5, paint);

      /// Draw highlighted "pie"
      paint.color = AppColors.chartColors[0];

      int fY = highlightedData.number > 0.75 ? 4 : 0;
      center = Offset(size.width / 2 + 4, size.height / 2 + fY);
      canvas.drawArc(Rect.fromCircle(center: center, radius: radius * 1.1),
          highlightedStartAngle, highlightedSweepAngle * animation.value, true, paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
