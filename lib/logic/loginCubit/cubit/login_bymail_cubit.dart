import 'package:bloc/bloc.dart';

import 'package:equatable/equatable.dart';
import 'package:leavemanagementadmin/listener/auth_login_listener.dart';
import 'package:leavemanagementadmin/repo/auth_repository.dart';

part 'login_bymail_state.dart';

class LoginBymailCubit extends Cubit<SendingotpStatusformail>
    implements AuthLoginListioner {
  final _authRepository = AuthRepository();
  LoginBymailCubit(SendingotpStatusformail initialState) : super(initialState);

  void emaillogin({required String email}) {
    _authRepository.emaillogin(authLoginListener: this, email: email);
  }

  @override
  void error() {
    emit(SendingotpStatusformail.error);
  }

  @override
  void loaded() {
    emit(SendingotpStatusformail.loaded);
  }

  @override
  void loading() {
    emit(SendingotpStatusformail.loading);
  }
}
