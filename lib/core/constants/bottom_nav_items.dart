import 'package:cliniq/core/constants/locale_keys.dart';
import 'package:cliniq/core/models/bottom_nav_item.dart';
import 'package:cliniq/core/utils/app_svgs.dart';

final List<BottomNavItem> bottomNavItems = [
  BottomNavItem(icon: AppSvgs.homeIcon),
  BottomNavItem(icon: AppSvgs.calendarIcon),
  BottomNavItem(
    icon: AppSvgs.doctorIcon,
    label: LocaleKeys.bottomNavigationBarAiChat,
    isCenter: true,
  ),
  BottomNavItem(icon: AppSvgs.chatIcon),
  BottomNavItem(icon: AppSvgs.profileIcon),
];
