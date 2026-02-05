import 'package:flutter/material.dart';
import 'package:cliniq/core/utils/app_theme_extension.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCardSection extends StatelessWidget {
  final List<Widget> children;

  const CustomCardSection({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 24.h),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      decoration: BoxDecoration(
        color: context.colorScheme.surfaceContainerLow,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: context.theme.dividerColor.withValues(alpha: 0.2),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(children: children),
    );
  }
}
