import 'package:baby_eduction/const/endpoints.dart';
import 'package:baby_eduction/network/api_service.dart';
import 'package:baby_eduction/views/notification/model/notification_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NotificationRepo {
    final ApiService _apiService = ApiService();


    Future<NotificationModel> getNotification(studentId) async {
        try {
            final response = await _apiService.get("${Endpoints.notification}&studentId=");
            return NotificationModel.fromJson(response.data);
        } catch (e) {
            rethrow;
        }
    }

}


final notificationRepo = Provider<NotificationRepo>((ref) {
  return NotificationRepo();
});