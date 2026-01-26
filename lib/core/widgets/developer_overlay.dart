import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cliniq/core/cubits/app_theme_cubit/app_theme_cubit.dart';
import 'package:cliniq/core/enums/app_theme_mode.dart';

class DeveloperOverlay extends StatelessWidget {
  final Widget child;

  const DeveloperOverlay({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        Positioned(
          bottom: 50,
          left: 16,
          child: FloatingActionButton(
            mini: true,
            onPressed: () async {
              await context.setLocale(
                context.locale == const Locale('en')
                    ? const Locale('ar')
                    : const Locale('en'),
              );
            },
            child: const Icon(Icons.language),
          ),
        ),
        Positioned(
          bottom: 50,
          right: 16,
          child: FloatingActionButton(
            mini: true,
            onPressed: () {
              final cubit = context.read<AppThemeCubit>();
              if (cubit.currentTheme == AppThemeMode.light) {
                cubit.changeTheme(AppThemeMode.dark);
              } else {
                cubit.changeTheme(AppThemeMode.light);
              }
            },
            child: const Icon(Icons.brightness_6),
          ),
        ),
      ],
    );
  }
}
