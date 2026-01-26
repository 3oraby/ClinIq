import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VerticalGap extends StatelessWidget {
  const VerticalGap(this.height, {super.key});

  final double height;
  @override
  Widget build(BuildContext context) {
    return height.verticalSpace;
  }
}
