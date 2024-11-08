import 'package:demo_bloc/core/app_config/app_palettes.dart';
import 'package:flutter/material.dart';

class AppStyle {
  static TextTheme primaryTextTheme = const TextTheme();
  static TextStyle primaryTextStyle = TextStyle(color: AppPalettes.defaultText);

  static EdgeInsets appShellPadding =
      const EdgeInsets.symmetric(vertical: 24, horizontal: 16);

  static const double seperator = 16;
  static const double verticalSeperator = 16;
  static const double horizontalSeperator = 16;

  static List<BoxShadow> appBoxShadows = [
    BoxShadow(
      color: Colors.black.withOpacity(0.1),
      blurRadius: 10,
      spreadRadius: 2,
      offset: Offset(5, 5),
    )
  ];
}
