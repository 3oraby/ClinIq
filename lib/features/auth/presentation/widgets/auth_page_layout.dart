import 'package:cliniq/core/utils/app_theme_extension.dart';
import 'package:cliniq/core/widgets/vertical_gap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthPageLayout extends StatelessWidget {
  final Widget topSection;
  final Widget bottomSection;

  const AuthPageLayout({
    super.key,
    required this.topSection,
    required this.bottomSection,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;

    return Scaffold(
      backgroundColor: context.theme.scaffoldBackgroundColor,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverPersistentHeader(
            pinned: true,
            delegate: _AuthHeaderDelegate(
              maxHeight: height * 0.4,
              minHeight: height * 0.2,
              child: topSection,
              backgroundColor: context.theme.primaryColor,
            ),
          ),

          SliverToBoxAdapter(child: VerticalGap(25)),

          SliverToBoxAdapter(
            child: Transform.translate(
              offset: Offset(0, -25.h),
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25.r),
                  topRight: Radius.circular(25.r),
                ),
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    horizontal: 35.w,
                    vertical: 24.h,
                  ),
                  color: context.theme.scaffoldBackgroundColor,
                  child: bottomSection,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _AuthHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;
  final Widget child;
  final Color backgroundColor;

  _AuthHeaderDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
    required this.backgroundColor,
  });

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => maxHeight;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    final progress = (shrinkOffset / (maxHeight - minHeight)).clamp(0.0, 1.0);

    final scale = (1 - 0.25 * progress).clamp(0.8, 1.0);

    return Container(
      color: backgroundColor,
      alignment: Alignment.center,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 24.h),
        child: Transform.scale(
          scale: scale,
          child: Opacity(
            opacity: (1 - 0.2 * progress).clamp(0.85, 1.0),
            child: child,
          ),
        ),
      ),
    );
  }

  @override
  bool shouldRebuild(covariant _AuthHeaderDelegate oldDelegate) => false;
}
