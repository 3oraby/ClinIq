import 'package:flutter/material.dart';
import 'package:cliniq/core/utils/app_dark_colors.dart';
import 'package:cliniq/core/utils/app_light_colors.dart';
import 'package:cliniq/core/utils/app_text_field_theme.dart';
import 'package:cliniq/core/utils/app_text_styles.dart';
import 'package:cliniq/core/utils/text_palette.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppLightColors.primaryColor,
    scaffoldBackgroundColor: AppLightColors.scaffoldBackgroundColor,
    dividerColor: AppLightColors.dividerColor,
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: AppLightColors.primaryColor,
      onPrimary: AppLightColors.textBackgroundColor,
      secondary: AppLightColors.textSecondaryColor,
      onSecondary: AppLightColors.textBackgroundColor,
      error: AppLightColors.errorColor,
      onError: AppLightColors.textBackgroundColor,
      surface: AppLightColors.headingColor,
      onSurface: Colors.white, // using for text which on dark surfaces
    ),
    extensions: [
      TextPalette(
        primaryColor: AppLightColors.textPrimaryColor,
        secondaryColor: AppLightColors.textSecondaryColor,
        tertiaryColor: AppLightColors.textTertiaryColor,
        helperColor: AppLightColors.textHelperColor,
        headingColor: AppLightColors.headingColor,
        paragraphColor: AppLightColors.paragraphColor,
        labelColor: AppLightColors.labelColor,
        contentBackgroundColor: AppLightColors.textBackgroundColor,
        alertColor: Colors.red,
        darkBlueDesign: AppLightColors.textDarkBlueDesignColor,
      ),
      AppTextFieldTheme(
        backgroundColor: AppLightColors.textFieldBackgroundColor,
        highLightBackgroundColor:
            AppLightColors.textFieldHighLightBackgroundColor,
        borderColor: AppLightColors.textFieldBorderColor,
        focusedBorderColor: AppLightColors.primaryColor,
      ),
    ],
    iconTheme: const IconThemeData(color: Color(0xFF0A73FF)),
    cardColor: AppLightColors.headingColor,
    buttonTheme: ButtonThemeData(
      colorScheme: ColorScheme.fromSwatch().copyWith(
        primary: AppLightColors.primaryColor,
        onPrimary: AppLightColors.textBackgroundColor,
      ),
    ),
    disabledColor: AppLightColors.disabledButtonBackgroundColor,
    dropdownMenuTheme: DropdownMenuThemeData(
      inputDecorationTheme: InputDecorationTheme(
        suffixIconColor: AppLightColors.dropDownIconColor,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      suffixIconColor: AppLightColors.paragraphColor,
      errorStyle: AppTextStyles.getTextStyle(
        9,
      ).copyWith(color: AppLightColors.errorColor),
      labelStyle: AppTextStyles.getTextStyle(
        16,
      ).copyWith(color: AppLightColors.headingColor),
      hintStyle: AppTextStyles.getTextStyle(
        16,
      ).copyWith(color: AppLightColors.headingColor),
    ),
    snackBarTheme: const SnackBarThemeData(
      backgroundColor: AppLightColors.primaryColor,
      contentTextStyle: TextStyle(color: Colors.white),
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppDarkColors.primaryColor,
    scaffoldBackgroundColor: AppDarkColors.scaffoldBackgroundColor,
    dividerColor: AppDarkColors.dividerColor,
    colorScheme: const ColorScheme(
      brightness: Brightness.dark,
      primary: AppDarkColors.primaryColor,
      onPrimary: AppDarkColors.textBackgroundColor,
      secondary: AppDarkColors.textSecondaryColor,
      onSecondary: AppDarkColors.textBackgroundColor,
      error: AppDarkColors.errorColor,
      onError: AppDarkColors.textBackgroundColor,
      surface: AppDarkColors.headingColor,
      onSurface: Colors.black, // using for text which on light surfaces
    ),
    extensions: [
      TextPalette(
        primaryColor: AppDarkColors.textPrimaryColor,
        secondaryColor: AppDarkColors.textSecondaryColor,
        tertiaryColor: AppDarkColors.textTertiaryColor,
        helperColor: AppDarkColors.textHelperColor,
        headingColor: AppDarkColors.headingColor,
        paragraphColor: AppDarkColors.paragraphColor,
        labelColor: AppDarkColors.labelColor,
        contentBackgroundColor: AppDarkColors.textBackgroundColor,
        alertColor: Colors.red,
        darkBlueDesign: AppDarkColors.textDarkBlueDesignColor,
      ),
      AppTextFieldTheme(
        backgroundColor: AppDarkColors.textFieldBackgroundColor,
        highLightBackgroundColor:
            AppDarkColors.textFieldHighLightBackgroundColor,
        borderColor: AppDarkColors.textFieldBorderColor,
        focusedBorderColor: AppDarkColors.primaryColor,
      ),
    ],
    iconTheme: const IconThemeData(color: Colors.white),
    cardColor: AppDarkColors.headingColor,
    disabledColor: AppDarkColors.disabledColor,
    dropdownMenuTheme: const DropdownMenuThemeData(
      inputDecorationTheme: InputDecorationTheme(
        suffixIconColor: AppDarkColors.dropDownIconColor,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      suffixIconColor: AppDarkColors.paragraphColor,
      labelStyle: AppTextStyles.getTextStyle(
        16,
      ).copyWith(color: AppDarkColors.headingColor),
      hintStyle: AppTextStyles.getTextStyle(
        16,
      ).copyWith(color: AppDarkColors.paragraphColor),
    ),
    snackBarTheme: const SnackBarThemeData(
      backgroundColor: AppDarkColors.primaryColor,
      contentTextStyle: TextStyle(color: Colors.white),
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}
