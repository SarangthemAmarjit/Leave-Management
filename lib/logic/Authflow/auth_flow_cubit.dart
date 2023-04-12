import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
part 'auth_flow_state.dart';

class AuthFlowCubit extends Cubit<AuthflowState> {
  AuthFlowCubit() : super(const AuthflowState(status: logStatus.initial));

  void getloginstatus() async {
    const storage = FlutterSecureStorage();

    if (await storage.containsKey(key: 'tokken')) {
      emit(const AuthflowState(status: logStatus.loggedIn));
    } else {
      emit(const AuthflowState(status: logStatus.loggedOut));
    }
  }
}
