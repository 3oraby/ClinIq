import 'package:flutter/material.dart';
import 'text_palette.dart';

extension AppThemeExt on BuildContext {
  ThemeData get theme => Theme.of(this);

  ColorScheme get colorScheme => theme.colorScheme;

  TextPalette get textPalette => theme.extension<TextPalette>()!;
}
