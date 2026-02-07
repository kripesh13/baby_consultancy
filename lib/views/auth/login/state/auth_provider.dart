import 'package:baby_eduction/network/api_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'auth_notifier.dart';
import 'auth_state.dart';

final apiServiceProvider = Provider<ApiService>((ref) {
  return ApiService();
});

final authProvider =
    StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  final apiService = ref.read(apiServiceProvider);
  return AuthNotifier(apiService,ref);
});
