import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:leavemanagementadmin/model/branchModel.dart';
import 'package:leavemanagementadmin/repo/auth_repository.dart';

part 'get_branch_state.dart';

class GetBranchCubit extends Cubit<GetBranchState> {
  GetBranchCubit() : super(GetBranchLoadingState());

  AuthRepository postRepository = AuthRepository();

  void getbranchlist() async {
    try {
      List<GetBranchModel>? emplist = await postRepository.getbranch();

      emit(GetBranchLoadedState(emplist!));
    } on DioError catch (ex) {
      if (ex.type == DioErrorType.connectionError) {
        emit(GetBranchErrorState(
            "Can't fetch posts, please check your internet connection!"));
        EasyLoading.showError(
            "Can't fetch posts, please check your internet connection!");
      } else {
        EasyLoading.showError(
            "Can't fetch posts, please check your internet connection!");
      }
    }
    return null;
  }
}
