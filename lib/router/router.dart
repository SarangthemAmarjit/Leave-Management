import 'package:auto_route/auto_route.dart';
import 'package:leavemanagementadmin/router/router.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  final List<AutoRoute> routes = [
    AutoRoute(
      path: '/',
      page: LoginRoute.page,
    ),
  ];
}
