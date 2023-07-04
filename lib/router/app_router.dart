import 'package:demo_app_architecture/dependency_injection/app_component.dart';
import 'package:demo_app_architecture/features/cats_list/cats_list_initial_params.dart';
import 'package:demo_app_architecture/features/cats_list/cats_list_page.dart';
import 'package:demo_app_architecture/router/routers.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRouter extends GoRouter {
  final GlobalKey<NavigatorState> navigatorKey;

  AppRouter(this.navigatorKey)
      : super(
          navigatorKey: navigatorKey,
          initialLocation: Routes.initial,
          routes: [
            GoRoute(
              path: Routes.initial,
              builder: (context, state) => getIt<CatsListPage>(
                param1: state.extra ?? const CatsListInitialParams(),
              ),
            ),
          ],
        );
}
