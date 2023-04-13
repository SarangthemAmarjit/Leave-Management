import 'package:dio/dio.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:leavemanagementadmin/Interceptor/diointerceptor.dart';
import 'package:leavemanagementadmin/Interceptor/storetoken.dart';
import 'package:leavemanagementadmin/listener/auth_login_listener.dart';
import 'package:leavemanagementadmin/model/emp%20_listmodel.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

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
    dio.interceptors.add(PrettyDioLogger());
  }

// Verify Otp From Email
  Future Verifyemail(
      {required String emailorphone,
      required String otp,
      required String userorphone,
      required AuthLoginListioner authLoginListener}) async {
    authLoginListener.loading();

    try {
      final response = await dio.post(
        verifyUser,
        data: {userorphone: emailorphone, "otp": otp},
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
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
  }
}
