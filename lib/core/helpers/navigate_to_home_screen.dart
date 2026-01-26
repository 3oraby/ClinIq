import 'package:flutter/material.dart';
import 'package:cliniq/core/utils/app_routes.dart';

navigateToHomeScreen(BuildContext context) {
  Navigator.of(
    context,
  ).pushNamedAndRemoveUntil(Routes.userHomeScreen, (route) => false);
}
