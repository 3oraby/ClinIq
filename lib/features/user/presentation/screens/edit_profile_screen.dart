import 'package:cliniq/core/constants/locale_keys.dart';
import 'package:cliniq/core/utils/app_theme_extension.dart';
import 'package:cliniq/features/user/data/models/user_profile_model.dart';
import 'package:cliniq/features/user/presentation/widgets/edit_profile_body.dart';
import 'package:cliniq/features/user/presentation/widgets/profile_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final UserProfileModel user = UserProfileModel.mock();
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _mobileController;
  late TextEditingController _heightController;
  late TextEditingController _weightController;
  late TextEditingController _ailmentsController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: user.name);
    _emailController = TextEditingController(text: user.email);
    _mobileController = TextEditingController(text: user.mobile);
    _heightController = TextEditingController(text: user.height);
    _weightController = TextEditingController(text: user.weight);
    _ailmentsController = TextEditingController(text: user.ailments);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _mobileController.dispose();
    _heightController.dispose();
    _weightController.dispose();
    _ailmentsController.dispose();
    super.dispose();
  }

  void _onSave() {
    // Logic for saving would go here
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorScheme.surface,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.h),
        child: ProfileAppBar(
          title: LocaleKeys.profileUserUpdateProfile,
          showBackButton: true,
          onBackAction: () => Navigator.pop(context),
        ),
      ),
      body: EditProfileBody(
        nameController: _nameController,
        emailController: _emailController,
        mobileController: _mobileController,
        heightController: _heightController,
        weightController: _weightController,
        ailmentsController: _ailmentsController,
        onSave: _onSave,
      ),
    );
  }
}
