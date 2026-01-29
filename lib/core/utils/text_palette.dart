import 'package:flutter/material.dart';

@immutable
class TextPalette extends ThemeExtension<TextPalette> {
  final Color primaryColor;
  final Color secondaryColor;
  final Color helperColor;
  final Color headingColor;
  final Color paragraphColor;
  final Color labelColor;
  final Color alertColor;

  const TextPalette({
    required this.primaryColor,
    required this.secondaryColor,
    required this.helperColor,
    required this.headingColor,
    required this.paragraphColor,
    required this.labelColor,
    required this.alertColor,
  });

  @override
  TextPalette copyWith({
    Color? primaryColor,
    Color? secondaryColor,
    Color? helperColor,
    Color? headingColor,
    Color? paragraphColor,
    Color? labelColor,
    Color? alertColor,
  }) {
    return TextPalette(
      primaryColor: primaryColor ?? this.primaryColor,
      secondaryColor: secondaryColor ?? this.secondaryColor,
      helperColor: helperColor ?? this.helperColor,
      headingColor: headingColor ?? this.headingColor,
      paragraphColor: paragraphColor ?? this.paragraphColor,
      labelColor: labelColor ?? this.labelColor,
      alertColor: alertColor ?? this.alertColor,
    );
  }

  @override
  TextPalette lerp(ThemeExtension<TextPalette>? other, double t) {
    if (other is! TextPalette) {
      return this;
    }
    return TextPalette(
      primaryColor: Color.lerp(primaryColor, other.primaryColor, t)!,
      secondaryColor: Color.lerp(secondaryColor, other.secondaryColor, t)!,
      helperColor: Color.lerp(helperColor, other.helperColor, t)!,
      headingColor: Color.lerp(headingColor, other.headingColor, t)!,
      paragraphColor: Color.lerp(paragraphColor, other.paragraphColor, t)!,
      labelColor: Color.lerp(labelColor, other.labelColor, t)!,
      alertColor: Color.lerp(alertColor, other.alertColor, t)!,
    );
  }
}
