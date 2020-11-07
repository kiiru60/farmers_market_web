import 'package:flutter/material.dart';

abstract class AppColors {
  static Color get darkgray => const Color(0xFF4e5b60);

  static Color get lightgray => const Color(0xFFc8d6ef);

  static Color get darkblue => const Color(0xFF263a44);

  static Color get lightblue => const Color(0xFF48a1af);

  static Color get straw => const Color(0xFFFFD600);

  static Color get white => const Color(0xFFFFFFFF);

  static Color get red => const Color(0xFFee5253);

  static Color get green => const Color(0xFF3b7d02);

  static Color get darkgreen => const Color(0xFF3b5e20);

  static Color get teal => const Color(0xFF004d40);

  static Color get orange => const Color(0xFFF57F17);

  static Color get brown => const Color(0xFF5D4037);

  static Color get frontgreen => const Color(0xFF00C853);

  static Color get facebook => const Color(0xFF3b5998);

  static Color get google => const Color(0xFF4285f4);
}

class AppSizes {
  static const int splashScreenTitleFontSize = 48;
  static const int titleFontSize = 34;
  static const double sidePadding = 15;
  static const double widgetSidePadding = 20;
  static const double buttonRadius = 25;
  static const double imageRadius = 8;
  static const double linePadding = 4;
  static const double widgetBorderRadius = 34;
  static const double textFieldRadius = 4.0;
  static const EdgeInsets bottomSheetPadding =
      EdgeInsets.symmetric(horizontal: 16, vertical: 10);
  static const app_bar_size = 56.0;
  static const app_bar_expanded_size = 180.0;
  static const tile_width = 148.0;
  static const tile_height = 276.0;
}
