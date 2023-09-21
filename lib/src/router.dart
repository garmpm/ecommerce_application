import 'package:auto_route/auto_route.dart';
import 'package:ecommerce_application/src/nav_frame.dart';
import 'package:ecommerce_application/src/pages/history_page.dart';
import 'package:ecommerce_application/src/pages/home_page.dart';
import 'package:ecommerce_application/src/pages/notifications_page.dart';
import 'package:ecommerce_application/src/pages/product_detail_page.dart';
import 'package:ecommerce_application/src/pages/rezervation_detail_page.dart';
import 'package:ecommerce_application/src/pages/search_page.dart';
part 'router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page|Frame,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(path: '/', page: NavRoute.page, initial: true, children: [
          AutoRoute(
              path: 'home',
              page: HomeRoute.page,
              initial: true,
              children: [
                AutoRoute(
                  path: 'details',
                  page: ProductDetailRoute.page,
                ),
              ]),
          AutoRoute(
            path: 'search',
            page: SearchRoute.page,
          ),
          AutoRoute(path: 'history', page: HistoryRoute.page, children: [
            AutoRoute(
              path: 'details',
              page: RezervationDetailRoute.page,
            ),
          ]),
          AutoRoute(
            path: 'notifications',
            page: NotificationsRoute.page,
          ),
        ]),
      ];
}
