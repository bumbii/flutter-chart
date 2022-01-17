import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

/// This method is used when we need to call a method after build() function is completed.
void onWidgetBuildDone(Function function) {
  SchedulerBinding.instance.addPostFrameCallback((_) {
    function();
  });
}

double getScreenWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

double getScreenHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

void hideKeyboard(BuildContext context) {
  FocusScope.of(context).requestFocus(FocusNode());
}

//void showToast(String message) {
//  Fluttertoast.showToast(
//      msg: message,
//      backgroundColor: Colors.black,
//      textColor: Colors.white);
//}