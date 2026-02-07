import 'package:baby_eduction/const/endpoints.dart';
import 'package:baby_eduction/network/api_service.dart';
import 'package:baby_eduction/views/profile/model/profile_model.dart';
import 'package:baby_eduction/views/profile/model/student_document_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/misc.dart';

class ProfileRepo {
  final ApiService _apiService = ApiService();

  Future<ProfileModel> getProfile() async {
    try {
      var response = await _apiService.get(Endpoints.profile);

      return ProfileModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<StudentDocumentModel> getDocument({studentId}) async {
    try {
      var response = await _apiService.get("${Endpoints.studentDocument}$studentId");

      return StudentDocumentModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
}

final profileRepo = Provider<ProfileRepo>((ref) {
  return ProfileRepo();
});
