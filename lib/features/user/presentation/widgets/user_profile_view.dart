import 'package:cliniq/core/constants/locale_keys.dart';
import 'package:cliniq/core/utils/app_routes.dart';
import 'package:cliniq/core/utils/app_text_styles.dart';
import 'package:cliniq/core/utils/app_theme_extension.dart';
import 'package:cliniq/core/widgets/custom_button.dart';
import 'package:cliniq/core/widgets/vertical_gap.dart';
import 'package:cliniq/features/user/data/models/user_profile_model.dart';
import 'package:cliniq/features/user/presentation/widgets/profile_header.dart';
import 'package:cliniq/features/user/presentation/widgets/profile_info_card.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserProfileView extends StatelessWidget {
  const UserProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    // Using mock data for now
    final userProfile = UserProfileModel.mock();

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Theme.of(context).primaryColor,
                Theme.of(context).primaryColor.withValues(alpha: 0.8),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        title: Text(
          LocaleKeys.profileUserTitle.tr(),
          style: AppTextStyles.getTextStyle(20).copyWith(
            fontWeight: FontWeight.w700,
            color: context.colorScheme.onPrimary,
          ),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: IconButton(
              icon: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withValues(alpha: 0.2),
                  border: Border.all(
                    color: Colors.white.withValues(alpha: 0.3),
                    width: 1,
                  ),
                ),
                child: Icon(
                  Icons.settings,
                  color: context.colorScheme.onPrimary,
                  size: 20,
                ),
              ),
              onPressed: () {
                Navigator.pushNamed(context, Routes.settingsScreen);
              },
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            ProfileHeader(name: userProfile.name, email: userProfile.email),
            const VerticalGap(30),
            ProfileInfoCard(userProfile: userProfile),
            const VerticalGap(30),
            SizedBox(
              width: 200.w,
              child: CustomButton(
                text: LocaleKeys.profileUserEditProfile.tr(),
                onPressed: () {
                  Navigator.pushNamed(context, Routes.editProfileScreen);
                },
              ),
            ),
            const VerticalGap(20),
          ],
        ),
      ),
    );
  }
}
