import 'package:baby_eduction/routes/route_names.dart';
import 'package:baby_eduction/storage/secure_storage_service.dart';
import 'package:baby_eduction/storage/storage_key.dart';
import 'package:baby_eduction/utils/custom_navigator.dart';
import 'package:baby_eduction/views/profile/model/student_document_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:baby_eduction/views/profile/model/profile_model.dart';
import 'package:baby_eduction/views/profile/repo/profile_repo.dart';
import 'package:flutter_riverpod/legacy.dart';

final profileProvider = ChangeNotifierProvider<ProfileNotifier>(
  (ref) => ProfileNotifier(ref),
);

class ProfileNotifier extends ChangeNotifier {
  final Ref ref;

  ProfileModel? profile;
  StudentDocumentModel? studentDocumentModel;
  bool isLoading = false;
  Object? error;
  StackTrace? stackTrace;

  ProfileNotifier(this.ref) {
    fetchProfile();
    getStudentDocument();
  }
  bool _mounted = true;

  @override
  void dispose() {
    _mounted = false;
    super.dispose();
  }

  Future<void> fetchProfile({BuildContext? context}) async {
    // if (!_mounted) return;

    isLoading = true;
    error = null;
    if (_mounted) notifyListeners();

    try {
      final repo = ref.read(profileRepo);
      profile = await repo.getProfile();

      // if (!_mounted) return;

      notifyListeners();
      final userId = profile?.data?.id;
      if (userId != null) {
        await SecureStorageService().write(
          key: StorageKeys.userId,
          value: userId.toString(),
        );
      } else {
        print("Warning: userId is null, cannot save");
      }

      if (context != null) {
        if (profile?.data?.personalDetail?.isPasswordResetRequired == true) {
          CustomNavigator.push(context, RouteNames.changePassword);
        } else {
          CustomNavigator.pushReplace(context, RouteNames.navBraScreen);
        }
      }
    } catch (e, st) {
      // if (!_mounted) return;
      error = e;
      stackTrace = st;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future getStudentDocument() async {
    final String? id =
        await SecureStorageService().read(key: StorageKeys.userId) ??
        profile?.data?.id?.toString();
    try {
      final repo = ref.read(profileRepo);
      studentDocumentModel = await repo.getDocument(studentId: id);
      notifyListeners();
    } catch (e) {}
  }
}
