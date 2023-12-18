import 'package:flutter/material.dart';

import 'colors.dart';

class TrackingThemes {
  TrackingThemes._();

  static final ColorScheme _colorSchemeLight = ColorScheme.light(
    primary: TrackingColors.primary,
    background: TrackingColors.lightGrey,
  );

  static final elevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      shape: const StadiumBorder(),
      backgroundColor: _colorSchemeLight.primary,
      minimumSize: const Size.fromHeight(42),
      disabledBackgroundColor: _colorSchemeLight.background,
      foregroundColor: Colors.white,
    ),
  );

  static final dividerThemeData = DividerThemeData(
    color: TrackingColors.primary.withOpacity(0.2),
  );

  static ThemeData get light {
    return ThemeData.from(
      colorScheme: _colorSchemeLight,
      useMaterial3: true,
    ).copyWith(
      elevatedButtonTheme: elevatedButtonTheme,
      dividerTheme: dividerThemeData,
    );
  }
}
