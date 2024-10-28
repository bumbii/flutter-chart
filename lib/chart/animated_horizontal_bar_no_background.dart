import 'package:demographics/utils/colors.dart';
import 'package:demographics/utils/dimens.dart';
import 'package:demographics/utils/ui_utils.dart';
import 'package:flutter/material.dart';

class AnimatedHorizontalBarNoBackground extends StatefulWidget {
  final num percentages;
  final String title;
  final Color color;
  final Color percentagesColor;
  final Color titleColor;

  AnimatedHorizontalBarNoBackground(
      {super.key,
      this.percentages = 0.0,
      this.title = '',
      this.color = AppColors.primary,
      this.percentagesColor = AppColors.primary,
      this.titleColor = AppColors.black});

  @override
  _AnimatedHorizontalBarNoBackgroundState createState() =>
      _AnimatedHorizontalBarNoBackgroundState();
}

class _AnimatedHorizontalBarNoBackgroundState
    extends State<AnimatedHorizontalBarNoBackground> {
  num _width = 0.0;

  @override
  void initState() {
    super.initState();

    onWidgetBuildDone(_onBuildDone);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: <Widget>[
            Container(
              width: 60.0,
              child: Text(
                '${widget.percentages}%',
                style: TextStyle(fontWeight: FontWeight.w500, color: widget.color),
              ),
            ),
            SizedBox(
              width: Dimens.formPaddingMedium,
            ),
            Expanded(
              child: Text(widget.title,
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: widget.titleColor)),
            )
          ],
        ),
        SizedBox(
          height: Dimens.formPaddingTiny,
        ),
        AnimatedContainer(
          duration: Duration(milliseconds: 1000),
          curve: Curves.bounceOut,
          width: _width * getScreenWidth(context) / 100,
          height: 8.0,
          decoration: BoxDecoration(
              color: widget.color,
              borderRadius: BorderRadius.all(Radius.circular(5.0))),
        ),
      ],
    );
  }

  _onBuildDone() async {
    await Future.delayed(Duration(milliseconds: 200));
    setState(() {
      _width = widget.percentages;
    });
  }
}
