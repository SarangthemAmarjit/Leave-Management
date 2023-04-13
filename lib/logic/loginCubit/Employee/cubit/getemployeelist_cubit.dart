import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:leavemanagementadmin/model/emp%20_listmodel.dart';
import 'package:leavemanagementadmin/repo/auth_repository.dart';

part 'getemployeelist_state.dart';

class GetemployeelistCubit extends Cubit<PostState> {
  GetemployeelistCubit() : super(PostLoadingState());

  AuthRepository postRepository = AuthRepository();

  void getemployeelist() async {
    try {
      List<EmployeeListModel>? emplist = await postRepository.fetchPosts();

      emit(PostLoadedState(emplist!));
    } on DioError catch (ex) {
      if (ex.type == DioErrorType.connectionError) {
        emit(PostErrorState(
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
