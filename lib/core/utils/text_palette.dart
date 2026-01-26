import 'package:flutter/material.dart';

@immutable
class TextPalette extends ThemeExtension<TextPalette> {
  final Color primaryColor;
  final Color secondaryColor;
  final Color tertiaryColor;
  final Color helperColor;
  final Color headingColor;
  final Color paragraphColor;
  final Color labelColor;
  final Color contentBackgroundColor;
  final Color alertColor;
  final Color darkBlueDesign;

  const TextPalette({
    required this.primaryColor,
    required this.secondaryColor,
    required this.tertiaryColor,
    required this.helperColor,
    required this.headingColor,
    required this.paragraphColor,
    required this.labelColor,
    required this.contentBackgroundColor,
    required this.alertColor,
    required this.darkBlueDesign,
  });

  @override
  TextPalette copyWith({
    Color? primaryColor,
    Color? secondaryColor,
    Color? tertiaryColor,
    Color? helperColor,
    Color? headingColor,
    Color? paragraphColor,
    Color? labelColor,
    Color? contentBackgroundColor,
    Color? alertColor,
    Color? darkBlueDesign,
  }) {
    return TextPalette(
      primaryColor: primaryColor ?? this.primaryColor,
      secondaryColor: secondaryColor ?? this.secondaryColor,
      tertiaryColor: tertiaryColor ?? this.tertiaryColor,
      helperColor: helperColor ?? this.helperColor,
      headingColor: headingColor ?? this.headingColor,
      paragraphColor: paragraphColor ?? this.paragraphColor,
      labelColor: labelColor ?? this.labelColor,
      contentBackgroundColor:
          contentBackgroundColor ?? this.contentBackgroundColor,
      alertColor: alertColor ?? this.alertColor,
      darkBlueDesign: darkBlueDesign ?? this.darkBlueDesign,
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
      tertiaryColor: Color.lerp(tertiaryColor, other.tertiaryColor, t)!,
      helperColor: Color.lerp(helperColor, other.helperColor, t)!,
      headingColor: Color.lerp(headingColor, other.headingColor, t)!,
      paragraphColor: Color.lerp(paragraphColor, other.paragraphColor, t)!,
      labelColor: Color.lerp(labelColor, other.labelColor, t)!,
      contentBackgroundColor: Color.lerp(
        contentBackgroundColor,
        other.contentBackgroundColor,
        t,
      )!,
      alertColor: Color.lerp(alertColor, other.alertColor, t)!,
      darkBlueDesign: Color.lerp(darkBlueDesign, other.darkBlueDesign, t)!,
    );
  }
}
