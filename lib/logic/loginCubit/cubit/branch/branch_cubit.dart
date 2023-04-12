import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:leavemanagementadmin/constant/apiendpoint.dart';
import 'package:leavemanagementadmin/logic/loginCubit/cubit/branch/branch_state.dart';

class BranchCubit extends Cubit<BranchState> {
  BranchCubit() : super(BranchState(branchstatus: BranchStatus.initial));

  Dio dio = Dio(BaseOptions(baseUrl: basebranchUrl));

  void addbranch({
    required String branchname,
  }) async {
    EasyLoading.show(status: "Loading....");

    try {
      var response = await dio.post(basebranchUrl, data: {"name": branchname});

      if (response.statusCode == 200 || response.statusCode == 201) {
        emit(BranchState(branchstatus: BranchStatus.loaded));
        log("Succesfully add branch name");
      } else {
        emit(BranchState(branchstatus: BranchStatus.error));
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
