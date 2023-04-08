import 'package:bloc/bloc.dart';

import 'package:equatable/equatable.dart';
import 'package:leavemanagementadmin/listener/auth_login_listener.dart';
import 'package:leavemanagementadmin/repo/auth_repository.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<Status> implements AuthLoginListener {
  final _authRepository = AuthRepository();
  LoginCubit(Status initialState) : super(initialState);

  void loginUser({required String email, required String password}) {
    _authRepository.login(
        authLoginListener: this, password: password, username: email);
  }

  @override
  void error() {
    emit(Status.error);
  }

  @override
  void loaded() {
    emit(Status.loaded);
  }

  @override
  void loading() {
    emit(Status.loading);
  }

  @override
  void nointernet() {
    // TODO: implement nointernet
  }
}
