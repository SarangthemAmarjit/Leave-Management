import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';

import 'package:equatable/equatable.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

part 'login_bymail_state.dart';

class LoginBymailCubit extends Cubit<SendingotpStatusformail>
    implements AuthLoginListener {
  final _authRepository = AuthRepository();
  LoginBymailCubit(SendingotpStatusformail initialState) : super(initialState);

    try {
      final response = await dio.post(
        loginUrl,
        data: {"username": email},
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        log(response.data['message']);
        // Login successful
        EasyLoading.showToast(
          'otp has been sent to your email',
        );
      } else {
        print('error');
        EasyLoading.showError(
          'Invalid Email or Phone',
        );
        // Login failed
        throw Exception('Failed to log in');
      }
    } catch (e) {
      EasyLoading.showError(
        'Invalid Email or Phone',
      );
      rethrow;
    }
  }
}
