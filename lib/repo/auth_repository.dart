import 'dart:developer';

import 'package:leavemanagementadmin/listener/auth_login_listener.dart';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepository {
  static const baseUrl = "https://staging.leave.globizs.com";
  static const loginUrl = "/api/auth/login";
  static const verifyUser = "/api/auth/login/verify";

  Dio dio = Dio(BaseOptions(baseUrl: baseUrl));

//Sending Otp to Email
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
        log(response.data['message']);
        // Login successful

        authLoginListener.loaded();
      } else {
        print('error');
        authLoginListener.error();
        // Login failed
        throw Exception('Failed to log in');
      }
    } catch (e) {
      authLoginListener.error();
      rethrow;
    }
  }
// Verify Otp From Email

  Future Verifyemail(
      {required String email,
      required String otp,
      required AuthLoginListener authLoginListener}) async {
    authLoginListener.loading();
    final prefs = await SharedPreferences.getInstance();
    try {
      final response = await dio.post(
        verifyUser,
        data: {"username": email, "otp": otp},
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        log('Verify mail response' + response.data['message']);

        // var finaldata = verifymailmodelFromJson(response.data);

        // log('Access Number :${finaldata.data.accessToken}');

        // Login successful
        prefs.setString('tokken', response.data['data']['accessToken']);
        authLoginListener.loaded();
      } else {
        print('error');
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
