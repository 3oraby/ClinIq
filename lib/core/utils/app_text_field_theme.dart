import 'package:flutter/material.dart';

@immutable
class AppTextFieldTheme extends ThemeExtension<AppTextFieldTheme> {
  final Color backgroundColor;
  final Color highLightBackgroundColor;
  final Color borderColor;
  final Color focusedBorderColor;

  const AppTextFieldTheme({
    required this.backgroundColor,
    required this.highLightBackgroundColor,
    required this.borderColor,
    required this.focusedBorderColor,
  });

  @override
  AppTextFieldTheme copyWith({
    Color? backgroundColor,
    Color? highLightBackgroundColor,
    Color? borderColor,
    Color? focusedBorderColor,
    double? borderRadius,
  }) {
    return AppTextFieldTheme(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      highLightBackgroundColor:
          highLightBackgroundColor ?? this.highLightBackgroundColor,
      borderColor: borderColor ?? this.borderColor,
      focusedBorderColor: focusedBorderColor ?? this.focusedBorderColor,
    );
  }

  @override
  AppTextFieldTheme lerp(ThemeExtension<AppTextFieldTheme>? other, double t) {
    if (other is! AppTextFieldTheme) return this;
    return AppTextFieldTheme(
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t)!,
      highLightBackgroundColor: Color.lerp(
        highLightBackgroundColor,
        other.highLightBackgroundColor,
        t,
      )!,
      borderColor: Color.lerp(borderColor, other.borderColor, t)!,
      focusedBorderColor: Color.lerp(
        focusedBorderColor,
        other.focusedBorderColor,
        t,
      )!,
    );
  }
}
