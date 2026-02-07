import 'package:baby_eduction/network/api_service.dart';
import 'package:baby_eduction/routes/route_names.dart';
import 'package:baby_eduction/storage/secure_storage_service.dart';
import 'package:baby_eduction/storage/storage_key.dart';
import 'package:baby_eduction/utils/bot_toast.dart';
import 'package:baby_eduction/utils/custom_navigator.dart';
import 'package:baby_eduction/views/profile/provider/profile_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'auth_state.dart';

class AuthNotifier extends StateNotifier<AuthState> {
  final ApiService apiService;
  final Ref ref;

  AuthNotifier(this.apiService, this.ref) : super(AuthState());

  Future<void> login(
    String email,
    String password,
    BuildContext context,
  ) async {
    loading(visible: true);
    state = state.copyWith(isLoading: true, error: null);

    try {
      final data = {'email': email, 'password': password};

      final response = await apiService.post(
        '/auth/student/authenticate',
        data: data,
      );

      if (response.statusCode == 200) {
        final storage = SecureStorageService();
        print(response.data);
        await storage.write(
          key: StorageKeys.token,
          value: response.data['token'],
        );
        ref.read(profileProvider).fetchProfile(context: context);
        state = state.copyWith(isLoading: false, isLoggedIn: true);
      }
    } catch (e) {
      print(e);
      state = state.copyWith(isLoading: false, error: 'Login failed');
    }
    loading(visible: false);
  }

  Future<void> changePassword(
    String newPassword,
    String currentPassword,
    BuildContext context,
  ) async {
    loading(visible: true);
    state = state.copyWith(isLoading: true, error: null);

    try {
      final data = {
        'currentPassword': currentPassword,
        'newPassword': newPassword,
      };

      final response = await apiService.post(
        '/api/student/change/password',
        data: data,
      );

      if (response.statusCode == 200) {
        final storage = SecureStorageService();

        storage.deleteAll();

        CustomNavigator.pushReplace(context, RouteNames.loginScreen);
      }
    } catch (e) {
      print(e);
      state = state.copyWith(isLoading: false, error: 'Login failed');
    }
    loading(visible: false);
  }
}
