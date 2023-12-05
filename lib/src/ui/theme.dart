import 'package:flutter/material.dart';
import 'package:tracking_app/src/ui/colors.dart';

class TrackingThemes {
  TrackingThemes._();

  static final ColorScheme _colorSchemeLight = ColorScheme.light(
    primary: TrackingColors.primary,
  );

  static ThemeData get light {
    return ThemeData.from(
      colorScheme: _colorSchemeLight,
      useMaterial3: true,
    ).copyWith();
  }
}
