import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';

abstract class MyTheme {
  ThemeData dark();
  ThemeData light();
  ThemeData activeTheme();
}

class AppTheme implements MyTheme {
  @override
  ThemeData activeTheme() {
    return ThemeData(
      scaffoldBackgroundColor: AppColor.scaffoldBackgroundColor,
      useMaterial3: true,
    );
  }

  @override
  ThemeData dark() {
    throw UnimplementedError();
  }

  @override
  ThemeData light() {
    throw UnimplementedError();
  }
}
