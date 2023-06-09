import 'dart:developer';

import 'package:auto_route/auto_route.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leavemanagementadmin/logic/Authflow/auth_flow_cubit.dart';
import 'package:leavemanagementadmin/router/router.gr.dart';

@RoutePage()
class AuthFlowPage extends StatefulWidget {
  const AuthFlowPage({Key? key}) : super(key: key);

  @override
  State<AuthFlowPage> createState() => _AuthFlowPageState();
}

class _AuthFlowPageState extends State<AuthFlowPage> {
  @override
  void initState() {
    context.read<AuthFlowCubit>().getloginstatus();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final s = context.watch<AuthFlowCubit>().state;
    final status = s.status;

    return AutoRouter.declarative(
      routes: (context) {
        log(status.toString());
        switch (status) {
          case logStatus.loggedIn:
            return [
              SidebarRoute()
              // const AppUpdaterRoute()
            ];
          case logStatus.loggedOut:
            return [const EmailInputRoute()];
          case logStatus.initial:
            return [];
        }
      },
    );
  }
}
