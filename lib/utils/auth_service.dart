import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthService with ChangeNotifier {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();
  bool _isAuthenticated = false;

  bool get isAuthenticated => _isAuthenticated;

  Future<void> saveToken(String token) async {
    await _storage.write(key: 'luxe_app', value: token);
    _isAuthenticated = true;
    notifyListeners();
  }

  Future<String?> getToken() async {
    return await _storage.read(key: 'luxe_app');
  }

  Future<void> deleteToken() async {
    await _storage.delete(key: 'luxe_app');
    _isAuthenticated = false;
    notifyListeners();
  }

  Future<void> checkAuthStatus() async {
    String? token = await getToken();
    _isAuthenticated = token != null;
    notifyListeners();
  }
}
