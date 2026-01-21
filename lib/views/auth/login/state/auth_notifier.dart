import 'package:baby_eduction/network/api_service.dart';
import 'package:baby_eduction/routes/route_names.dart';
import 'package:baby_eduction/storage/secure_storage_service.dart';
import 'package:baby_eduction/storage/storage_key.dart';
import 'package:baby_eduction/utils/bot_toast.dart';
import 'package:baby_eduction/utils/custom_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'auth_state.dart';

class AuthNotifier extends StateNotifier<AuthState> {
  final ApiService apiService;

  AuthNotifier(this.apiService) : super(AuthState());

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
        CustomNavigator.pushReplace(context, RouteNames.navBraScreen);
        state = state.copyWith(isLoading: false, isLoggedIn: true);
      }
    } catch (e) {
      print(e);
      state = state.copyWith(isLoading: false, error: 'Login failed');
    }
    loading(visible: false);
  }
}
