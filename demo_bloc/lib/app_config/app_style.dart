import 'package:demo_bloc/app_config/app_palettes.dart';
import 'package:flutter/material.dart';

class AppStyle {
  static TextTheme primaryTextTheme = TextTheme();
  static TextStyle primaryTextStyle = TextStyle(color: AppPalettes.defaultText);

  static EdgeInsets appShellPadding =
      const EdgeInsets.symmetric(vertical: 24, horizontal: 16);
}
