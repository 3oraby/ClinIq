import 'package:flutter/material.dart';

class AppDarkColors {
  static const Color primary = Color(0xFF4200FF);
  static const Color onPrimary = Color(0xFFFFFFFF);

  static const Color secondary = Color(0xFF4200FF);
  static const Color onSecondary = Color(0xFFFFFFFF);

  static const Color backgroundColor = Color(0xFF000000); // Dark background
  static const Color onBackground = Color(
    0xFFFFFFFF,
  ); // Text on dark background

  /// Elevated cards / prominent containers
  static const Color surfaceContainerHigh = Color(0xFF323232); // Darker card
  static const Color onSurfaceContainerHigh = Color(0xFFFFFFFF);

  /// Medium cards / default containers
  static const Color surfaceContainerMedium = Color(0xFF1E252D);
  static const Color onSurfaceContainerMedium = Color(0xFFFFFFFF);

  /// Light containers / TextField / Input backgrounds
  static const Color surfaceContainerLow = Color(
    0xFF2C2C2E,
  ); // Slightly lighter for input
  static const Color onSurfaceContainerLow = Color(0xFFFFFFFF);

  static const Color onSurface = Color(0xFFFFFFFF);

  static const Color onSurfaceVariant = Color(0xFFBEBEBE); // Subtitle text
  static const Color onSurfaceVariantLight = Color(
    0xFF9E9E9E,
  ); // Secondary text
  static const Color onSurfaceSecondary = Color(
    0xFF8E8E93,
  ); // Less important text

  /// Hint text / placeholder
  static const Color outline = Color(0xFF6E6E70);

  /// Selected items, highlighted cards, or chip backgrounds
  static const Color primaryContainer = Color(0xFF00C3D0);
  static const Color onPrimaryContainer = Color(0xFF000000);

  static const Color primaryText = Color(0xFFFFFFFF);
  static const Color secondaryText = Color(0xFFC3C3C3);
  static const Color tertiaryText = Color(0xFF4F5E7B);
  static const Color helperText = Color(0xFF808080);
  static const Color labelText = Color(0xFF1E252D);
  static const Color alertText = Color(0xFFB00020);
  static const Color subLabelText = Color(0xFF333333);

  /// Error color
  static const Color error = Color(0xFFCF6679);
  static const Color onError = Color(0xFF000000);
}
