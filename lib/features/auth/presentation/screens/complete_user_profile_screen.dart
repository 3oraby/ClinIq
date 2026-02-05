import 'package:cliniq/core/constants/locale_keys.dart';
import 'package:cliniq/core/helpers/show_custom_snack_bar.dart';
import 'package:cliniq/core/utils/app_routes.dart';
import 'package:cliniq/core/utils/app_theme_extension.dart';
import 'package:cliniq/core/utils/success.dart';
import 'package:cliniq/core/widgets/custom_modal_progress_hud.dart';
import 'package:cliniq/features/auth/presentation/providers/complete_profile_provider.dart';
import 'package:cliniq/features/auth/presentation/widgets/complete_user_profile_body.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CompleteUserProfileScreen extends ConsumerWidget {
  const CompleteUserProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(completeProfileProvider, (prev, next) {
      if (next is AsyncData && next.value is Success) {
        Navigator.pushReplacementNamed(context, Routes.userHomeScreen);
      } else if (next is AsyncError) {
        showCustomSnackBar(context, next.error.toString());
      }
    });

    return CustomModalProgressHUD(
      inAsyncCall: ref.watch(completeProfileProvider).isLoading,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: context.theme.primaryColor,
          title: Text(
            LocaleKeys.completeProfileTitle.tr(),
            style: const TextStyle(color: Colors.white),
          ),
        ),
        body: const CompleteProfileBody(),
      ),
    );
  }
}
