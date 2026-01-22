import 'package:baby_eduction/const/endpoints.dart';
import 'package:baby_eduction/network/api_service.dart';
import 'package:baby_eduction/views/home/model/university_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';



final homeRepo = Provider<HomeRepo>((ref) {
  return HomeRepo();
});

class HomeRepo {
  
    final ApiService _apiService = ApiService();

Future<UniversityModel> getUniversity({
  int page = 0,
  int limit = 10,
}) async {
  try {
    final response = await _apiService.get(
      "${Endpoints.university}&page=$page&limit=$limit",
    );

    return UniversityModel.fromJson(response.data);
  } catch (e) {
    rethrow;
  }
}

 


}