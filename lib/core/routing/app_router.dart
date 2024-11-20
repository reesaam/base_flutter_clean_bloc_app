import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';

import '../../features/homepage/presentation/pages/homepage_view.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {

  @override
  RouteType get defaultRouteType => const RouteType.adaptive();

  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: HomeRoute.page, initial: true),
  ];
}