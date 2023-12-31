import 'package:connectivity/connectivity.dart';
import 'package:demo_app_architecture/core/api_constants.dart';
import 'package:demo_app_architecture/core/domain/database/database_client.dart';
import 'package:demo_app_architecture/core/domain/networking/networking_client.dart';
import 'package:demo_app_architecture/router/app_navigator.dart';
import 'package:demo_app_architecture/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:demo_app_architecture/features/cats_list/dependency_injection/feature_component.dart'
    as cats_list;
//DO-NOT-REMOVE APP_COMPONENT_IMPORTS

import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
//DO-NOT-REMOVE APP_COMPONENT_INIT
//DO-NOT-REMOVE FEATURE_COMPONENT_INIT

void initDependencies() {
  _configureNavigator();
  _configureConnectivity();
  _configureNetworkClient();
  _configureDatabaseClient();
  cats_list.configureDependencies();
}

_configureNavigator() {
  getIt
    ..registerLazySingleton<GlobalKey<NavigatorState>>(
      () => GlobalKey<NavigatorState>(),
    )
    ..registerLazySingleton<AppRouter>(
      () => AppRouter(getIt()),
    )
    ..registerLazySingleton(() => AppNavigator(getIt()));
}

void _configureNetworkClient() =>
    getIt.registerFactory(() => NetworkClient(baseUrl: ApiConstants.baseUrl));

void _configureDatabaseClient() =>
    getIt.registerFactory(() => DatabaseClient());

void _configureConnectivity() =>
    getIt.registerFactory<Connectivity>(() => Connectivity());
