import 'package:baby_eduction/storage/storage_key.dart';
import 'package:dio/dio.dart';
import '../storage/secure_storage_service.dart';

class DioClient {
  static Dio getDio() {
    final dio = Dio(
      BaseOptions(
        baseUrl: 'https://babyeducation.com.np',
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 15),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json', 
        },
      ),
    );

    final storage = SecureStorageService();

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          // 🔐 Skip token for login
          if (!options.path.contains('/auth/student/authenticate')) {
            final token = await storage.read(key: StorageKeys.token);

            if (token != null && token.isNotEmpty) {
              options.headers['Authorization'] = 'Bearer $token';
            }
          }

          // ✅ Example: you can add any extra header dynamically here
          options.headers['X-App-Version'] = '1.0.0';
          options.headers['X-Platform'] = 'Flutter';

          print('➡️ REQUEST [${options.method}] => ${options.uri}');
          print('Headers: ${options.headers}');
          print('Body: ${options.data}');

          handler.next(options);
        },
        onResponse: (response, handler) {
          print('✅ RESPONSE [${response.statusCode}] => ${response.data}');
          handler.next(response);
        },
        onError: (DioException e, handler) {
          print('❌ ERROR [${e.response?.statusCode}] => ${e.response?.data}');
          handler.next(e);
        },
      ),
    );

    return dio;
  }
}
