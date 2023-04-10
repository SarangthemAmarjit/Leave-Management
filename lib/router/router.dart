import 'package:auto_route/auto_route.dart';
import 'package:leavemanagementadmin/router/router.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  final List<AutoRoute> routes = [
    AutoRoute(path: '/', page: AuthFlowRoute.page, children: [
      AutoRoute(
        page: EmailInputRoute.page,
      ),
      AutoRoute(
        page: SidebarRoute.page,
      ),
    ]),
    AutoRoute(
      path: '/sidebar',
      page: SidebarRoute.page,
    ),
    AutoRoute(
      path: '/login',
      page: LoginRoute.page,
    ),
    AutoRoute(
      path: '/emailinput',
      page: EmailInputRoute.page,
    ),
  ];
}
