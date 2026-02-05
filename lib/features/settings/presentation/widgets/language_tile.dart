import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:cliniq/core/constants/locale_keys.dart';
import 'settings_action_tile.dart';
import 'package:cliniq/core/utils/app_text_styles.dart';

class LanguageTile extends StatelessWidget {
  const LanguageTile({super.key});

  @override
  Widget build(BuildContext context) {
    return SettingsActionTile(
      title: LocaleKeys.settingsUserLanguage.tr(),
      icon: Icons.language_outlined,
      trailing: Text(
        context.locale.languageCode == 'en'
            ? LocaleKeys.settingsUserEnglish.tr()
            : LocaleKeys.settingsUserArabic.tr(),
        style: AppTextStyles.getTextStyle(14).copyWith(color: Colors.grey),
      ),
      onTap: () => _showLanguageDialog(context),
    );
  }

  void _showLanguageDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(LocaleKeys.settingsUserLanguage.tr()),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: Text(LocaleKeys.settingsUserEnglish.tr()),
              trailing: context.locale.languageCode == 'en'
                  ? Icon(Icons.check, color: Theme.of(context).primaryColor)
                  : null,
              onTap: () {
                context.setLocale(const Locale('en'));
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text(LocaleKeys.settingsUserArabic.tr()),
              trailing: context.locale.languageCode == 'ar'
                  ? Icon(Icons.check, color: Theme.of(context).primaryColor)
                  : null,
              onTap: () {
                context.setLocale(const Locale('ar'));
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
