import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:baby_eduction/storage/secure_storage_service.dart';
import 'package:baby_eduction/storage/storage_key.dart';
import 'package:flutter_riverpod/legacy.dart';
import '../model/notification_model.dart';
import '../repo/notification_repo.dart';

final notificationProvider =
    ChangeNotifierProvider<NotificationProvider>((ref) {
  return NotificationProvider(ref);
});

class NotificationProvider extends ChangeNotifier {
  final Ref ref;

  NotificationProvider(this.ref);

  NotificationModel? notificationModel;
  bool isLoading = false;

  Future<void> getNotification() async {
    isLoading = true;
    notifyListeners();

    final userId = await SecureStorageService().read(key: StorageKeys.userId);

    try {
      final response = await ref.read(notificationRepo).getNotification(userId);
      notificationModel = response;
    } catch (e, stack) {
      debugPrint('Failed to fetch notifications: $e');
      debugPrintStack(stackTrace: stack);
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}