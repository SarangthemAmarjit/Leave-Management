// import 'dart:developer';

// import 'package:leavemanagementadmin/listener/auth_login_listener.dart';

// import 'package:dio/dio.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// import '../constant/apiendpoint.dart';

// class AuthRepository {
//   Dio dio = Dio(BaseOptions(baseUrl: baseUrl));

// //Sending Otp to Email
//   Future createdrancgh(
//       {required String email,
//       required AuthLoginListioner authLoginListener}) async {
//     authLoginListener.loading();
//     try {
//       final response = await dio.post(
//         loginUrl,
//         data: {"username": email},
//       );

//       if (response.statusCode == 200 || response.statusCode == 201) {
//         log(response.data['message']);
//         // Login successful

//         authLoginListener.loaded();
//       } else {
//         print('error');
//         authLoginListener.error();
//         // Login failed
//         throw Exception('Failed to log in');
//       }
//     } catch (e) {
//       authLoginListener.error();
//       rethrow;
//     }
//   }

// }
