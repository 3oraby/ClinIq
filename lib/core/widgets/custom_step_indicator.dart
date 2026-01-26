import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cliniq/core/utils/app_dark_colors.dart';
import 'package:cliniq/core/utils/app_light_colors.dart';

class CustomStepIndicator extends StatelessWidget {
  final int count;
  final int currentIndex;
  final Color? activeColor;
  final Color? inactiveColor;
  final double dotSize;
  final double lineLength;
  final double lineWidth;
  final double dashWidth;
  final double dashSpace;

  const CustomStepIndicator({
    super.key,
    required this.count,
    required this.currentIndex,
    this.activeColor,
    this.inactiveColor,
    this.dotSize = 20,
    this.lineLength = 49,
    this.lineWidth = 2,
    this.dashWidth = 6,
    this.dashSpace = 2,
  });

  @override
  Widget build(BuildContext context) {
    Color activeColor =
        this.activeColor ??
        (Theme.of(context).brightness == Brightness.light
            ? AppLightColors.activeIndicatorColor
            : AppDarkColors.activeIndicatorColor);

    Color inactiveColor =
        this.inactiveColor ??
        (Theme.of(context).brightness == Brightness.light
            ? AppLightColors.inActiveIndicatorColor
            : AppDarkColors.inActiveIndicatorColor);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(count * 2 - 1, (index) {
        if (index.isEven) {
          final stepIndex = index ~/ 2;
          final isActive = stepIndex <= currentIndex;
          return Container(
            width: dotSize.w,
            height: dotSize.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isActive ? activeColor : inactiveColor,
            ),
          );
        } else {
          final stepIndex = (index - 1) ~/ 2;
          final isActive = stepIndex < currentIndex;
          return SizedBox(
            width: lineLength.w,
            height: lineWidth.h,
            child: CustomPaint(
              painter: DashedLinePainter(
                color: isActive ? activeColor : inactiveColor,
                strokeWidth: lineWidth.w,
                dashWidth: dashWidth.w,
                dashSpace: dashSpace.w,
                dashRadius: lineWidth.w / 2,
                startPadding: 0,
                endPadding: 0,
              ),
            ),
          );
        }
      }),
    );
  }
}

class DashedLinePainter extends CustomPainter {
  final Color color;
  final double strokeWidth;
  final double dashWidth;
  final double dashSpace;
  final double startPadding; // padding قبل اول dash
  final double endPadding; // padding بعد اخر dash
  final double dashRadius; // لجعل dash مستديرة

  DashedLinePainter({
    required this.color,
    required this.strokeWidth,
    required this.dashWidth,
    required this.dashSpace,
    this.startPadding = 0,
    this.endPadding = 0,
    this.dashRadius = 2,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.fill;

    double startX = startPadding;
    final maxWidth = size.width - endPadding;

    while (startX < maxWidth) {
      double endX = startX + dashWidth;
      if (endX > maxWidth) endX = maxWidth;
      final rect = RRect.fromRectAndRadius(
        Rect.fromLTWH(startX, 0, endX - startX, strokeWidth),
        Radius.circular(dashRadius),
      );
      canvas.drawRRect(rect, paint);
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(covariant DashedLinePainter oldDelegate) {
    return oldDelegate.color != color ||
        oldDelegate.strokeWidth != strokeWidth ||
        oldDelegate.dashWidth != dashWidth ||
        oldDelegate.dashSpace != dashSpace ||
        oldDelegate.startPadding != startPadding ||
        oldDelegate.endPadding != endPadding ||
        oldDelegate.dashRadius != dashRadius;
  }
}
