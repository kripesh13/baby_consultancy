import 'package:baby_eduction/const/endpoints.dart';
import 'package:baby_eduction/network/api_service.dart';
import 'package:baby_eduction/views/home/model/university_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';



final homeRepo = Provider<HomeRepo>((ref) {
  return HomeRepo();
});

class HomeRepo {
  
    final ApiService _apiService = ApiService();


 Future<UniversityModel> getUniversity()async{
    try {
      var response = await _apiService.get(Endpoints.university);
  
   return UniversityModel.fromJson(response.data);

    } catch (e) {
      rethrow;
    }
  }
 


}