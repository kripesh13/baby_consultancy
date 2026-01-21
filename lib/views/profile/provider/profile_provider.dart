import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:baby_eduction/views/profile/model/profile_model.dart';
import 'package:baby_eduction/views/profile/repo/profile_repo.dart';
import 'package:flutter_riverpod/legacy.dart';

final profileProvider = ChangeNotifierProvider.autoDispose<ProfileNotifier>(
  (ref) => ProfileNotifier(ref),
);

class ProfileNotifier extends ChangeNotifier {
  final Ref ref;

  ProfileModel? profile;
  bool isLoading = false;
  Object? error;
  StackTrace? stackTrace;

  ProfileNotifier(this.ref) {
    fetchProfile();
  }

  Future<void> fetchProfile() async {
    isLoading = true;
    error = null;
    notifyListeners();

    try {
      final repo = ref.read(profileRepo);
      profile = await repo.getProfile();
    } catch (e, st) {
      error = e;
      stackTrace = st;
      // Optional: log error
      // debugPrint("Profile fetch error: $e\n$st");
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> refresh() => fetchProfile();
}