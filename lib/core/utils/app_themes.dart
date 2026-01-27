import 'package:flutter/material.dart';
import 'package:cliniq/core/utils/app_dark_colors.dart';
import 'package:cliniq/core/utils/app_light_colors.dart';
import 'package:cliniq/core/utils/app_text_styles.dart';
import 'package:cliniq/core/utils/text_palette.dart';

class AppTheme {
  /// ----------------- Light Theme -----------------
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    useMaterial3: true,

    // Core Colors
    primaryColor: AppLightColors.primary,
    scaffoldBackgroundColor: AppLightColors.backgroundColor,
    dividerColor: AppLightColors.onSurfaceSecondary,
    cardColor: AppLightColors.surfaceContainerHigh,
    disabledColor: AppLightColors.onSurfaceVariantLight,

    // Icon Theme
    iconTheme: const IconThemeData(color: AppLightColors.onSurface),

    // Color Scheme
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: AppLightColors.primary,
      onPrimary: AppLightColors.onPrimary,
      secondary: AppLightColors.secondary,
      onSecondary: AppLightColors.onSecondary,
      error: AppLightColors.error,
      onError: AppLightColors.onError,
      surface: AppLightColors.backgroundColor,
      onSurface: AppLightColors.onBackground,
      surfaceContainerHigh: AppLightColors.surfaceContainerHigh,
      surfaceContainerLow: AppLightColors.surfaceContainerLow,
      onSurfaceVariant: AppLightColors.onSurfaceVariant,
      outline: AppLightColors.outline,
      primaryContainer: AppLightColors.primaryContainer,
      onPrimaryContainer: AppLightColors.onPrimaryContainer,
    ),

    // TextPalette & TextField Extensions
    extensions: [
      TextPalette(
        primaryColor: AppLightColors.onBackground,
        secondaryColor: AppLightColors.onSurfaceSecondary,
        tertiaryColor: AppLightColors.onSurfaceVariantLight,
        helperColor: AppLightColors.outline,
        headingColor: AppLightColors.onSurface,
        paragraphColor: AppLightColors.onSurfaceVariant,
        labelColor: AppLightColors.onSurfaceSecondary,
        contentBackgroundColor: AppLightColors.backgroundColor,
        alertColor: AppLightColors.error,
        darkBlueDesign: AppLightColors.primary,
      ),
    ],

    // Input Decorations
    inputDecorationTheme: InputDecorationTheme(
      suffixIconColor: AppLightColors.onSurfaceVariantLight,
      labelStyle: AppTextStyles.getTextStyle(
        16,
      ).copyWith(color: AppLightColors.onSurface),
      hintStyle: AppTextStyles.getTextStyle(
        16,
      ).copyWith(color: AppLightColors.outline),
      errorStyle: AppTextStyles.getTextStyle(
        12,
      ).copyWith(color: AppLightColors.error),
    ),

    // SnackBar Theme
    snackBarTheme: const SnackBarThemeData(
      backgroundColor: AppLightColors.primary,
      contentTextStyle: TextStyle(color: Colors.white),
    ),

    visualDensity: VisualDensity.adaptivePlatformDensity,
  );

  /// ----------------- Dark Theme -----------------
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    useMaterial3: true,

    // Core Colors
    primaryColor: AppDarkColors.primary,
    scaffoldBackgroundColor: AppDarkColors.backgroundColor,
    dividerColor: AppDarkColors.onSurfaceSecondary,
    cardColor: AppDarkColors.surfaceContainerHigh,
    disabledColor: AppDarkColors.onSurfaceVariantLight,

    // Icon Theme
    iconTheme: const IconThemeData(color: AppDarkColors.onSurface),

    // Color Scheme
    colorScheme: const ColorScheme(
      brightness: Brightness.dark,
      primary: AppDarkColors.primary,
      onPrimary: AppDarkColors.onPrimary,
      secondary: AppDarkColors.secondary,
      onSecondary: AppDarkColors.onSecondary,
      error: AppDarkColors.error,
      onError: AppDarkColors.onError,
      surface: AppDarkColors.backgroundColor,
      onSurface: AppDarkColors.onBackground,
      surfaceContainerHigh: AppDarkColors.surfaceContainerHigh,
      surfaceContainerLow: AppDarkColors.surfaceContainerLow,
      surfaceContainerHighest: AppDarkColors.surfaceContainerMedium,
      onSurfaceVariant: AppDarkColors.onSurfaceVariant,
      outline: AppDarkColors.outline,
      primaryContainer: AppDarkColors.primaryContainer,
      onPrimaryContainer: AppDarkColors.onPrimaryContainer,
    ),

    // TextPalette & TextField Extensions
    extensions: [
      TextPalette(
        primaryColor: AppDarkColors.onBackground,
        secondaryColor: AppDarkColors.onSurfaceSecondary,
        tertiaryColor: AppDarkColors.onSurfaceVariantLight,
        helperColor: AppDarkColors.outline,
        headingColor: AppDarkColors.onSurface,
        paragraphColor: AppDarkColors.onSurfaceVariant,
        labelColor: AppDarkColors.onSurfaceSecondary,
        contentBackgroundColor: AppDarkColors.backgroundColor,
        alertColor: AppDarkColors.error,
        darkBlueDesign: AppDarkColors.primary,
      ),
    ],

    // Input Decorations
    inputDecorationTheme: InputDecorationTheme(
      suffixIconColor: AppDarkColors.onSurfaceVariantLight,
      labelStyle: AppTextStyles.getTextStyle(
        16,
      ).copyWith(color: AppDarkColors.onSurface),
      hintStyle: AppTextStyles.getTextStyle(
        16,
      ).copyWith(color: AppDarkColors.outline),
      errorStyle: AppTextStyles.getTextStyle(
        12,
      ).copyWith(color: AppDarkColors.error),
    ),

    // SnackBar Theme
    snackBarTheme: const SnackBarThemeData(
      backgroundColor: AppDarkColors.primary,
      contentTextStyle: TextStyle(color: Colors.white),
    ),

    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}
