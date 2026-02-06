import 'package:cliniq/core/utils/app_text_styles.dart';
import 'package:cliniq/core/utils/app_theme_extension.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final bool showBackButton;
  final VoidCallback? onBackAction;

  const ProfileAppBar({
    super.key,
    required this.title,
    this.actions,
    this.showBackButton = true,
    this.onBackAction,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.colorScheme.primary,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(32.r),
          bottomRight: Radius.circular(32.r),
        ),
        boxShadow: [
          BoxShadow(
            color: context.colorScheme.primary.withValues(alpha: 0.2),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Left Section: Back Button
              if (showBackButton)
                IconButton(
                  onPressed: onBackAction ?? () => Navigator.pop(context),
                  icon: Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: context.colorScheme.onPrimary,
                    size: 20.sp,
                  ),
                )
              else
                SizedBox(width: 48.w), // Placeholder to keep title centered
              // Center Section: Title
              Expanded(
                child: Text(
                  title.tr(),
                  textAlign: TextAlign.center,
                  style: AppTextStyles.getTextStyle(20).copyWith(
                    fontWeight: FontWeight.w800,
                    color: context.colorScheme.onPrimary,
                    letterSpacing: -0.5,
                  ),
                ),
              ),

              // Right Section: Actions
              if (actions != null)
                Row(mainAxisSize: MainAxisSize.min, children: actions!)
              else
                SizedBox(width: 48.w), // Placeholder to keep title centered
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(80.h);
}
