import 'package:flutter/material.dart';
import 'package:tracking_app/src/packages/core/ui/colors.dart';
import 'package:tracking_app/src/packages/core/ui/dimens.dart';

class AppTheme {
  AppTheme._();

  static final ColorScheme _colorScheme = ColorScheme.light(
    primary: AppColors.primary,
  );

  static final _elevatedButtonTheme = ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
    backgroundColor: _colorScheme.primary,
    foregroundColor: Colors.white,
    minimumSize: const Size.fromHeight(AppDimens.dimen_44),
  ));

  static ThemeData get light {
    return ThemeData.from(
      colorScheme: _colorScheme,
      useMaterial3: true,
    ).copyWith(
      elevatedButtonTheme: _elevatedButtonTheme,
    );
  }
}
