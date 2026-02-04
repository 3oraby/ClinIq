import 'package:cliniq/core/constants/locale_keys.dart';
import 'package:cliniq/core/utils/app_theme_extension.dart';
import 'package:cliniq/core/widgets/vertical_gap.dart';
import 'package:cliniq/features/user/data/models/user_profile_model.dart';
import 'package:cliniq/features/user/presentation/widgets/profile_info_row.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ProfileInfoCard extends StatelessWidget {
  const ProfileInfoCard({super.key, required this.userProfile});

  final UserProfileModel userProfile;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
      decoration: BoxDecoration(
        color: context.colorScheme.surface,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 25,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        children: [
          ProfileInfoRow(
            title: LocaleKeys.profileUserBloodGroup.tr(),
            value: userProfile.bloodGroup,
            icon: Icons.bloodtype_outlined,
          ),
          const VerticalGap(20),
          ProfileInfoRow(
            title: LocaleKeys.profileUserEmail.tr(),
            value: userProfile.email,
            icon: Icons.email_outlined,
          ),
          const VerticalGap(20),
          ProfileInfoRow(
            title: LocaleKeys.profileUserMobile.tr(),
            value: userProfile.mobile,
            icon: Icons.phone_iphone_outlined,
          ),
          const VerticalGap(20),
          ProfileInfoRow(
            title: LocaleKeys.profileUserHeight.tr(),
            value: userProfile.height,
            icon: Icons.height,
          ),
          const VerticalGap(20),
          ProfileInfoRow(
            title: LocaleKeys.profileUserWeight.tr(),
            value: userProfile.weight,
            icon: Icons.monitor_weight_outlined,
          ),
          const VerticalGap(20),
          ProfileInfoRow(
            title: LocaleKeys.profileUserAilments.tr(),
            value: userProfile.ailments,
            icon: Icons.medical_services_outlined,
          ),
        ],
      ),
    );
  }
}
