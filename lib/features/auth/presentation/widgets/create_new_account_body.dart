import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cliniq/core/constants/locale_keys.dart';
import 'package:cliniq/core/helpers/show_custom_snack_bar.dart';
import 'package:cliniq/core/utils/success.dart';
import 'package:cliniq/features/auth/presentation/providers/sign_up_provider.dart';
import 'package:cliniq/features/auth/presentation/providers/verify_email_provider.dart';

class CreateNewAccountBody extends ConsumerStatefulWidget {
  const CreateNewAccountBody({super.key});

  @override
  ConsumerState<CreateNewAccountBody> createState() =>
      _CreateNewAccountBodyState();
}

class _CreateNewAccountBodyState extends ConsumerState<CreateNewAccountBody> {
  final PageController pageController = PageController();

  String pageTitle = LocaleKeys.authCreateAccountTitle.tr();

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  void goToNextPage() {
    pageController.nextPage(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  // TODO: use listenManual later
  void listenOnSignUpProvider() {
    ref.listen(signUpProvider, (previous, next) {
      if (next is AsyncError) {
        showCustomSnackBar(context, next.error.toString().tr());
      } else if (next is AsyncData && next.value is Success) {
        goToNextPage();
        setState(() {
          pageTitle = LocaleKeys.authCreateAccountVerifyEmailTitle.tr();
        });
      }
    });
  }

  void listenOnVerifyEmailProvider() {
    ref.listen(verifyEmailProvider, (previous, next) {
      if (next is AsyncError) {
        showCustomSnackBar(context, next.error.toString().tr());
      } else if (next is AsyncData && next.value is Success) {
        goToNextPage();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    listenOnSignUpProvider();
    listenOnVerifyEmailProvider();

    return SizedBox();
  }
}
