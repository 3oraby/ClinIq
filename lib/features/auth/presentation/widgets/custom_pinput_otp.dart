import 'package:cliniq/core/utils/app_constants.dart';
import 'package:cliniq/core/utils/app_theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';
import 'package:cliniq/core/utils/app_text_styles.dart';

class CustomPinputOtp extends StatelessWidget {
  const CustomPinputOtp({super.key, required this.otpController});

  final TextEditingController otpController;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Pinput(
        length: AppConstants.pinCodeLength,
        controller: otpController,
        animationCurve: Curves.bounceIn,
        keyboardType: TextInputType.number,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        submittedPinTheme: PinTheme(
          height: 48.h,
          width: 48.h,
          decoration: BoxDecoration(
            color: context.inputTheme.highLightBackgroundColor,
            borderRadius: BorderRadius.circular(9.r),
          ),
          textStyle: AppTextStyles.getTextStyle(14).copyWith(
            fontWeight: FontWeight.w300,
            color: context.textPalette.primaryColor,
          ),
        ),
        defaultPinTheme: PinTheme(
          height: 48.h,
          width: 48.h,
          decoration: BoxDecoration(
            color: context.inputTheme.backgroundColor,
            borderRadius: BorderRadius.circular(9.r),
          ),
          textStyle: AppTextStyles.getTextStyle(18).copyWith(
            fontWeight: FontWeight.w300,
            color: context.textPalette.helperColor,
          ),
        ),
      ),
    );
  }
}
