import 'package:cliniq/core/utils/app_theme_extension.dart';
import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 1,
      color: context.theme.dividerColor.withValues(alpha: 0.2),
    );
  }
}
