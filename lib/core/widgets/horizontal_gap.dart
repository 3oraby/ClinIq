import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HorizontalGap extends StatelessWidget {
  const HorizontalGap(this.width, {super.key});

  final double width;
  @override
  Widget build(BuildContext context) {
    return width.horizontalSpace;
  }
}
