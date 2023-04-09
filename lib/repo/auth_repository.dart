import 'package:leavemanagementadmin/listener/auth_login_listener.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:dio/dio.dart';

class AuthRepository {
  static const baseUrl = "https://leavemngt.globizsapp.com";
  static const loginUrl = "/api/auth/login";
  static const verifyUser = "/api/auth/login/verify";

  Dio dio = Dio(BaseOptions(baseUrl: baseUrl));

  Future emaillogin(
      {required String email,
      required AuthLoginListener authLoginListener}) async {
    authLoginListener.loading();
    try {
      final response = await dio.post(
        loginUrl,
        data: {"username": email},
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        // Login successful
        String token = response.data['token'];
        authLoginListener.loaded();
        return token;
      } else {
        authLoginListener.error();
        // Login failed
        throw Exception('Failed to log in');
      }
    } catch (e) {
      authLoginListener.error();
      rethrow;
    }
  }

  Future phonelogin(
      {required String phone,
      required AuthLoginListener authLoginListener}) async {
    authLoginListener.loading();
    try {
      final response = await dio.post(
        loginUrl,
        data: {"phone": phone},
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        // Login successful
        String token = response.data['token'];
        authLoginListener.loaded();
        return token;
      } else {
        authLoginListener.error();
        // Login failed
        throw Exception('Failed to log in');
      }
    } catch (e) {
      authLoginListener.error();
      rethrow;
    }
  }
}
