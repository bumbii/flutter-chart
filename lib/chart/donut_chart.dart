import 'dart:math';

import 'package:demographics/chart/chart_container.dart';
import 'package:demographics/chart/chart_data_name.dart';
import 'package:demographics/model/chart_data.dart';
import 'package:demographics/utils/colors.dart';
import 'package:demographics/utils/dimens.dart';
import 'package:demographics/utils/number_utils.dart';
import 'package:demographics/utils/ui_utils.dart';
import 'package:flutter/material.dart';

class DonutChart extends StatefulWidget {
  final String chartName;
  final double? radius;
  final Widget centerWidget;
  final List<ChartData> data;

  const DonutChart(
      {super.key,
      required this.chartName,
      required this.centerWidget,
      required this.data,
      this.radius});

  @override
  _DonutChartState createState() => _DonutChartState();
}

class _DonutChartState extends State<DonutChart>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

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
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double radius =
        widget.radius != null ? widget.radius! : getScreenWidth(context) * 0.3;
    double strokeWidth = radius / 2;

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
                  height: radius * 2 + strokeWidth / 2,
                  child: CustomPaint(
                    foregroundPainter: DonutChatPainter(widget.data,
                        radius: radius,
                        strokeWidth: strokeWidth,
                        animation: _animation),
                  ),
                ),
                ScaleTransition(
                  scale: _animation,
                  alignment: Alignment.center,
                  child: widget.centerWidget,
                )
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
    if (widget.data.length > 0) {
      int colorIndex = 0;
      widget.data.forEach((chartData) {
        ChartDataName chartDataName = ChartDataName(
          name: chartData.name,
          percentages: '${convertToPercent((chartData.number))}',
          color: AppColors.chartColors[colorIndex++],
        );

        chartDataNames.add(chartDataName);
      });

      return chartDataNames;
    }
    return [Container()];
  }
}

class DonutChatPainter extends CustomPainter {
  final double radius;
  final double strokeWidth;
  final List<ChartData> data;
  final Animation animation;

  DonutChatPainter(this.data,
      {required this.radius,
      required this.strokeWidth,
      required this.animation});

  @override
  void paint(Canvas canvas, Size size) {
    int colorIndex = 0;
    Paint paint = Paint()
      ..color = AppColors.chartColors[colorIndex]
      ..style = PaintingStyle.stroke
      ..strokeWidth = this.strokeWidth;

    Offset center = Offset(size.width / 2, size.height / 2);

    double startAngle = -pi / 2;
    double totalSweepAngle = 0;
    double currentSweepAngle = 0;

    this.data.forEach((ChartData chartData) {
      /// Calculate sweep angle, subtract {pi / 100} to make a small spaces between 2 parts
      totalSweepAngle = 2 * pi * chartData.number - pi / 100;
      currentSweepAngle = totalSweepAngle * animation.value;

      canvas.drawArc(Rect.fromCircle(center: center, radius: radius),
          startAngle, currentSweepAngle, false, paint);

      /// Calculate new start angle, add {pi / 100} to make a small space between 2 parts
      startAngle += totalSweepAngle + pi / 100;
      paint.color = AppColors.chartColors[++colorIndex];
    });
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
