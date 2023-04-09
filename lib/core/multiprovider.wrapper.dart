import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leavemanagementadmin/logic/Authflow/auth_flow_cubit.dart';
import 'package:leavemanagementadmin/logic/loginCubit/cubit/login_bymail_cubit.dart';
import 'package:leavemanagementadmin/logic/loginCubit/cubit/login_byphone_cubit.dart';

class MultiproviderWrapper extends StatelessWidget {
  final Widget child;
  const MultiproviderWrapper({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (context) => LoginBymailCubit(Status.initial)),
      BlocProvider(create: (context) => LoginByphoneCubit(Status2.initial)),
      BlocProvider(
        create: (context) => AuthFlowCubit(),
      ),
    ], child: child);
  }
}
