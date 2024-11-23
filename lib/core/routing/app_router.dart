import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';

import '../../features/homepage/presentation/pages/homepage_view.dart';
import '../../shared/shared_mems/core_mems/app_page_detail_mem/app_page_detail.dart';
import '../context_holder.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => const RouteType.adaptive();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: HomeRoute.page, initial: true),
      ];

  gotoPage(AppPageDetailEntity page) => getContext.router.push(_findPage(page));
  replacePage(AppPageDetailEntity page) => getContext.router.replace(_findPage(page));
  // popUntilPage(PageRouteInfo route) => getContext.router.popUntil(route);
  goBack() => getContext.router.back();

  _findPage(AppPageDetailEntity page) => routes.firstWhere((e) => e.page.name == page.pageRoute);
}
