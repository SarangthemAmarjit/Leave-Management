import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:leavemanagementadmin/Interceptor/diointerceptor.dart';
import 'package:leavemanagementadmin/Interceptor/storetoken.dart';
import 'package:leavemanagementadmin/constant/apiendpoint.dart';
import 'package:leavemanagementadmin/listener/auth_login_listener.dart';

class AuthRepository {
  static const baseUrl = "https://staging.leave.globizs.com";
  static const loginUrl = "/api/auth/login";
  static const verifyUser = "/api/auth/login/verify";

//Sending Otp to Email
  late final Dio dio;
//
//
  AuthRepository() {
    dio = Dio(BaseOptions(baseUrl: baseUrl));
    dio.interceptors.add(DioInterceptor());
  }

// Verify Otp From Email
  Future Verifyemail(
      {required String otp,
      required AuthLoginListioner authLoginListener,
      required String emailorphone,
      required String userorphone}) async {
    authLoginListener.loading();

    try {
      final response = await dio.post(
        verifyUser,
        data: {userorphone: emailorphone, "otp": otp},
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        log('Verify mail response' + response.data['message']);
        Store.setToken(response.data['data']['accessToken']);

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
      required AuthLoginListioner authLoginListener}) async {
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

  // Add Branch
  Future<dynamic> addbranch({
    required String branchname,
    // required String isactive,
    required AuthLoginListioner authLoginListener,
  }) async {
    authLoginListener.loading();
    try {
      var response = await dio.post(
        branchaddurl,
        data: {
          "name": branchname,
          //"is_activ": isactive
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        log("Successfully added branch name");
      } else {}
    } catch (e) {
      log(e.toString());
    }
  }

  // Update Branch

  Future<dynamic> updatebranch({
    required String branchname,
    required String isactive,

    // required String isactive,
    required AuthLoginListioner authLoginListener,
  }) async {
    authLoginListener.loading();
    try {
      var response = await dio.post(
        updateBranchURL,
        data: {
          "name": branchname,
          "is_active": isactive
          //"is_activ": isactive
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        log("Successfully Update branch data");
      } else {}
    } catch (e) {
      log(e.toString());
    }
  }

// Post DEPARTMENT
  Future<dynamic> postdept({
    required String departmentname,
    // required String isactive,
    required AuthLoginListioner authLoginListener,
  }) async {
    authLoginListener.loading();
    try {
      var response = await dio.post(
        postdeptUrl,
        data: {
          "name": departmentname,
          //"is_activ": isactive
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        log("Successfully added department name");
      } else {}
    } catch (e) {
      log(e.toString());
    }
  }

  /// ADD DESIGNATION

  Future<dynamic> postdesignation({
    required String designationname,
    // required String isactive,
    required AuthLoginListioner authLoginListener,
  }) async {
    authLoginListener.loading();
    try {
      var response = await dio.post(
        postdesignationURL,
        data: {
          "name": designationname,
          //"is_activ": isactive
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        log("Successfully added designation name");
      } else {}
    } catch (e) {
      log(e.toString());
    }
  }

  // GET BRANCH
  Future<dynamic> getbranch({
    required AuthLoginListioner authLoginListener,
  }) async {
    authLoginListener.loading();
    try {
      var response = await dio.post(getbranchUrl, data: {});

      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data;
        log("Successfully added branch name");
      } else {}
    } catch (e) {
      log(e.toString());
    }
  }
}
