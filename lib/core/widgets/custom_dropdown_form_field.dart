import 'package:cliniq/core/utils/app_theme_extension.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cliniq/core/utils/app_text_styles.dart';

class CustomDropdownFormField extends StatelessWidget {
  final List<String> items;
  final String hintText;
  final String? helperText;
  final ValueChanged<String?>? onChanged;
  final EdgeInsetsGeometry? contentPadding;
  final String? selectedValue;
  final TextStyle? valueStyle;

  const CustomDropdownFormField({
    super.key,
    required this.items,
    required this.hintText,
    this.helperText,
    this.onChanged,
    this.contentPadding,
    this.selectedValue,
    this.valueStyle,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2<String>(
        value: selectedValue,
        isExpanded: true,
        onChanged: onChanged,
        hint: Text(
          hintText.tr(),
          style: AppTextStyles.getTextStyle(
            14,
          ).copyWith(color: context.textPalette.helperColor),
        ),
        style: AppTextStyles.getTextStyle(
          14,
        ).copyWith(color: context.textPalette.primaryColor),
        buttonStyleData: ButtonStyleData(
          height: 46.h,
          padding: contentPadding ?? EdgeInsets.only(left: 6.r, right: 7.r),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(
              width: 1.r,
              color: context.inputTheme.borderColor,
            ),
            color: context.inputTheme.highLightBackgroundColor,
          ),
        ),
        dropdownStyleData: DropdownStyleData(
          maxHeight: 192.h,
          padding: EdgeInsets.zero,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            color: context.inputTheme.backgroundColor,
          ),
          offset: const Offset(0, 0),
          scrollbarTheme: ScrollbarThemeData(
            radius: const Radius.circular(40),
            thickness: WidgetStateProperty.all<double>(6),
            thumbVisibility: WidgetStateProperty.all<bool>(true),
          ),
        ),
        menuItemStyleData: MenuItemStyleData(
          height: 30.h,
          padding: EdgeInsets.zero,
        ),
        selectedItemBuilder: (context) => items.map((value) {
          return Text(
            value,
            style:
                valueStyle ??
                AppTextStyles.getTextStyle(
                  14,
                ).copyWith(color: context.textPalette.primaryColor),
          );
        }).toList(),

        items: items.map((value) {
          return DropdownMenuItem(
            value: value,
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: 1.r,
                    color: context.inputTheme.borderColor,
                  ),
                ),
              ),
              child: Text(
                value,
                style: AppTextStyles.getTextStyle(
                  14,
                ).copyWith(color: context.textPalette.primaryColor),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
