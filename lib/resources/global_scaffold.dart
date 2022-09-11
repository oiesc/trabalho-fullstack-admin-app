import 'package:adminapp/resources/global_colors.dart';
import 'package:flutter/material.dart';

class GlobalScaffold {
  static final GlobalScaffold instance = GlobalScaffold();
  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  void showSnackBar(SnackBar snackBar) {
    scaffoldMessengerKey.currentState?.showSnackBar(snackBar);
  }

  void snackBarStatus(String message, {Color? color}) {
    showSnackBar(SnackBar(
      content: Text(message),
      backgroundColor: color ?? GlobalColors.blue,
    ));
  }
}
