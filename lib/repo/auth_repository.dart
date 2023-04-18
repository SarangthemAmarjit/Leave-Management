import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:leavemanagementadmin/Interceptor/diointerceptor.dart';
import 'package:leavemanagementadmin/Interceptor/storetoken.dart';
import 'package:leavemanagementadmin/constant/apiendpoint.dart';
import 'package:leavemanagementadmin/listener/auth_login_listener.dart';

import 'package:leavemanagementadmin/model/emp%20_listmodel.dart';

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
        authLoginListener.loaded();
        EasyLoading.showToast("Successfully added");
      } else {
        authLoginListener.error();
      }
    } catch (e) {
      log(e.toString());
    }
  }

  // Update Branch

  Future<dynamic> updatebranch({
    required int id,
    required String branchname,
    required String isactive,

    // required String isactive,
    required AuthLoginListioner authLoginListener,
  }) async {
    authLoginListener.loading();
    try {
      var response = await dio.patch(
        "https://staging.leave.globizs.com/api/admin/update/branch/$id",
        data: {
          "name": branchname,
          "is_active": isactive
          //"is_activ": isactive
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        log("Successfully Update branch data");
        authLoginListener.loaded();
      } else {}
    } catch (e) {
      authLoginListener.error();
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
        authLoginListener.loaded();
      } else {
        authLoginListener.error();
      }
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
        authLoginListener.loaded();
      } else {
        authLoginListener.error();
      }
    } catch (e) {
      authLoginListener.error();
      log(e.toString());
    }
  }

  // GET BRANCH

  Future<List<EmployeeListModel>?> fetchPosts() async {
    try {
      final response = await dio.get("/api/admin/employees");
      if (response.statusCode == 200) {
        List<dynamic> postMaps = response.data;
        return postMaps.map((e) => EmployeeListModel.fromJson(e)).toList();
      } else {
        EasyLoading.showError('Cannot fetch Data');
      }
    } catch (ex) {
      rethrow;
    }
    return null;
  }

  // Create Employee
  void createEmployee({
    required String empname,
    required String empusername,
    required String email,
    required String empcode,
    required String phonenumber,
    required int deptid,
    required int designid,
    required int branchid,
    required int roleid,
    required DateTime dateofjoining,
    required String emptype,

    // required String isactive,
    required AuthLoginListioner authLoginListener,
  }) async {
    authLoginListener.loading();
    try {
      var response = await dio.post(createempUrl, data: {
        "username": "direct intern",
        "email": "directintern@example.com",
        "emp_code": 268,
        "name": "direct intern",
        "branch_id": 1,
        "department_id": 2,
        "designation_id": 3,
        "date_of_joining": "2022-01-01",
        "phone": "123456784",
        "emp_type": "1",
        "role": 1
      });

      if (response.statusCode == 200 || response.statusCode == 201) {
        log("Successfully added branch name");
        authLoginListener.loaded();
        EasyLoading.showToast("Successfully added Employee");
      } else {
        authLoginListener.error();
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
