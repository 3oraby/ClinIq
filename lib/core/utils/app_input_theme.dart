import 'package:flutter/material.dart';

@immutable
class AppInputTheme extends ThemeExtension<AppInputTheme> {
  final Color backgroundColor;
  final Color highLightBackgroundColor;
  final Color borderColor;
  final Color focusedBorderColor;
  final Color disabledBackgroundColor;
  final Color errorBorderColor;
  final Color textColor;
  final Color hintColor;
  final Color iconColor;

  const AppInputTheme({
    required this.backgroundColor,
    required this.highLightBackgroundColor,
    required this.borderColor,
    required this.focusedBorderColor,
    required this.disabledBackgroundColor,
    required this.errorBorderColor,
    required this.textColor,
    required this.hintColor,
    required this.iconColor,
  });

  @override
  AppInputTheme copyWith({
    Color? backgroundColor,
    Color? highLightBackgroundColor,
    Color? borderColor,
    Color? focusedBorderColor,
    Color? disabledBackgroundColor,
    Color? errorBorderColor,
    Color? textColor,
    Color? hintColor,
    Color? iconColor,
  }) {
    return AppInputTheme(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      highLightBackgroundColor:
          highLightBackgroundColor ?? this.highLightBackgroundColor,
      borderColor: borderColor ?? this.borderColor,
      focusedBorderColor: focusedBorderColor ?? this.focusedBorderColor,
      disabledBackgroundColor:
          disabledBackgroundColor ?? this.disabledBackgroundColor,
      errorBorderColor: errorBorderColor ?? this.errorBorderColor,
      textColor: textColor ?? this.textColor,
      hintColor: hintColor ?? this.hintColor,
      iconColor: iconColor ?? this.iconColor,
    );
  }

  @override
  AppInputTheme lerp(ThemeExtension<AppInputTheme>? other, double t) {
    if (other is! AppInputTheme) return this;
    return AppInputTheme(
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t)!,
      highLightBackgroundColor:
          Color.lerp(highLightBackgroundColor, other.highLightBackgroundColor, t)!,
      borderColor: Color.lerp(borderColor, other.borderColor, t)!,
      focusedBorderColor:
          Color.lerp(focusedBorderColor, other.focusedBorderColor, t)!,
      disabledBackgroundColor:
          Color.lerp(disabledBackgroundColor, other.disabledBackgroundColor, t)!,
      errorBorderColor: Color.lerp(errorBorderColor, other.errorBorderColor, t)!,
      textColor: Color.lerp(textColor, other.textColor, t)!,
      hintColor: Color.lerp(hintColor, other.hintColor, t)!,
      iconColor: Color.lerp(iconColor, other.iconColor, t)!,
    );
  }
}
