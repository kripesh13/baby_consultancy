import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageService {
  static const FlutterSecureStorage _storage =
      FlutterSecureStorage();

  // WRITE
  Future<void> write({
    required String key,
    required String value,
  }) async {
    await _storage.write(key: key, value: value);
  }

  // READ
  Future<String?> read({
    required String key,
  }) async {
    return await _storage.read(key: key);
  }

  // DELETE SINGLE KEY
  Future<void> delete({
    required String key,
  }) async {
    await _storage.delete(key: key);
  }

  // DELETE ALL
  Future<void> deleteAll() async {
    await _storage.deleteAll();
  }

  // READ ALL (OPTIONAL BUT USEFUL)
  Future<Map<String, String>> readAll() async {
    return await _storage.readAll();
  }
}
