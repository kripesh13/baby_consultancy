import 'package:baby_eduction/network/api_service.dart';
import 'package:baby_eduction/views/student/model/testimonial_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StudentRepo {
  final ApiService _apiService = ApiService();
  Future<TestimonialModel> getTestimonial() async {
    try {
      final response =
          await _apiService.get("/auth/testimonial/all?statusIn=ACTIVE");

      return TestimonialModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
}

Provider<StudentRepo> studentRepo = Provider<StudentRepo>((ref) {
  return StudentRepo();
});
