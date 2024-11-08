import 'package:demographics/chart/chart_header.dart';
import 'package:demographics/utils/colors.dart';
import 'package:demographics/utils/dimens.dart';
import 'package:flutter/material.dart';

class ChartContainer extends StatelessWidget {
  final Widget child;
  final String chartName;
  final Color borderColor;
  final Color color;
  final Function? onInfoIconPressed;

  const ChartContainer(
      {super.key,
      required this.child,
      required this.chartName,
      this.borderColor = AppColors.lightGrey,
      this.color = AppColors.white,
      this.onInfoIconPressed});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Card(
            color: this.color,
            shape: RoundedRectangleBorder(
                side: BorderSide(color: this.borderColor),
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            elevation: 4,
            child: Padding(
              padding: EdgeInsets.all(Dimens.formPadding / 2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: Dimens.formPadding / 2,
                              top: Dimens.formPadding / 2),
                          child: ChartHeader(
                            chartName: this.chartName,
                          ),
                        ),
                      ),
                      this.onInfoIconPressed != null
                          ? GestureDetector(
                              child: Icon(
                                Icons.info,
                                size: MediaQuery.of(context).size.width / 12,
                              ),
                              onTap: () {
                                this.onInfoIconPressed?.call();
                              },
                            )
                          : Container()
                    ],
                  ),
                  SizedBox(
                    height: Dimens.formPadding / 2,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(Dimens.formPadding / 2),
                    child: this.child,
                  )
                ],
              ),
            )),
      ),
    );
  }
}
