import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

@singleton
class SecureStorage {
  final FlutterSecureStorage storage = const FlutterSecureStorage();
  final String accessTokenKey = 'accessToken';
  final String refreshTokenKey = 'refreshToken';

  Future<void> writeData(String key, String value) async {
    await storage.write(key: key, value: value);
  }

  Future<void> writeMultiData(Map<String, String> map) async {
    for (var key in map.keys) {
      await storage.write(key: key, value: map[key]);
    }
  }

  Future<String?> readData(String key) async {
    return await storage.read(key: key);
  }

  Future<void> deleteData(String key) async {
    await storage.delete(key: key);
  }

  Future<void> writeToken(
      {required String accessToken, required String refreshToken}) async {
    await storage.write(key: accessTokenKey, value: accessToken);
    await storage.write(key: refreshTokenKey, value: accessToken);
  }

  Future<void> deleteToken() async {
    await storage.delete(key: accessTokenKey);
    await storage.delete(key: refreshTokenKey);
  }

  Future<String?> getAccessToken() async {
    return await storage.read(key: accessTokenKey);
  }

  Future<String?> getRefreshToken() async {
    return await storage.read(key: refreshTokenKey);
  }
}
