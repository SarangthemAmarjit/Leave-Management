import 'package:bloc/bloc.dart';

import 'package:equatable/equatable.dart';
import 'package:leavemanagementadmin/listener/auth_login_listener.dart';
import 'package:leavemanagementadmin/repo/auth_repository.dart';

part 'login_bymail_state.dart';

class LoginBymailCubit extends Cubit<Status> implements AuthLoginListener {
  final _authRepository = AuthRepository();
  LoginBymailCubit(Status initialState) : super(initialState);

  void emaillogin({required String email}) {
    _authRepository.emaillogin(authLoginListener: this, email: email);
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
}
