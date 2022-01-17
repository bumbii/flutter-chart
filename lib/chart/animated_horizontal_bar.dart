import 'package:demographics/utils/colors.dart';
import 'package:demographics/utils/dimens.dart';
import 'package:demographics/utils/ui_utils.dart';
import 'package:flutter/material.dart';

class AnimatedHorizontalBar extends StatefulWidget {
  final num width;
  final String title;
  final Color color;

  AnimatedHorizontalBar({Key key, this.width = 0, this.title, this.color})
      : super(key: key);

  @override
  _AnimatedHorizontalBarState createState() => _AnimatedHorizontalBarState();
}

class _AnimatedHorizontalBarState extends State<AnimatedHorizontalBar> {
  num _width = 0.0;

  @override
  void initState() {
    super.initState();

    onWidgetBuildDone(_onBuildDone);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              '${widget.width}%',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            Expanded(
              child: Text(widget.title,
                  textAlign: TextAlign.end,
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: AppColors.clickableText)),
            )
          ],
        ),
        SizedBox(
          height: 8.0,
        ),
        Stack(
          children: <Widget>[
            Container(
              width: getScreenWidth(context),
              height: 8.0,
              decoration: BoxDecoration(
                  color: AppColors.horizontalBgColor,
                  borderRadius: BorderRadius.all(Radius.circular(5.0))),
            ),
            AnimatedContainer(
              duration: Duration(milliseconds: 1000),
              curve: Curves.bounceOut,
              width: _width * (getScreenWidth(context) - Dimens.formPadding * 2 - Dimens.formPaddingSmall * 2) / 100,
              height: 8.0,
              decoration: BoxDecoration(
                  color: widget.color,
                  borderRadius: BorderRadius.all(Radius.circular(5.0))),
            ),
          ],
        ),
      ],
    );
  }

  _onBuildDone() async {
    await Future.delayed(Duration(milliseconds: 200));
    setState(() {
      _width = widget.width;
    });
  }
}
