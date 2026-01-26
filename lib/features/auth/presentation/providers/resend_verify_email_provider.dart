import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cliniq/features/auth/presentation/providers/get_auth_repo_provider.dart';

final resendVerifyEmailProvider = FutureProvider.autoDispose
    .family<void, String>((ref, String email) async {
      await ref.read(getAuthRepoProvider).resendVerifyEmail(email: email);
    });
