import 'package:flutter/material.dart';
import 'package:tracking_app/src/packages/core/ui/ui.dart';

class TrackingThemes {
  TrackingThemes._();

  static final ColorScheme _colorSchemeLight = ColorScheme.light(
    primary: TrackingColors.primary,
  );

  static final _elevetedButtonTheme = ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
    shape: const StadiumBorder(),
    backgroundColor: _colorSchemeLight.primary,
    foregroundColor: Colors.white,
    minimumSize: const Size.fromHeight(TrackingDimens.dimen_44),
  ));

  static ThemeData get light {
    return ThemeData.from(
      colorScheme: _colorSchemeLight,
      useMaterial3: true,
    ).copyWith(
      elevatedButtonTheme: _elevetedButtonTheme,
    );
  }
}
