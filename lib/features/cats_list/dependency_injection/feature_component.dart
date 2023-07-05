import 'package:demo_app_architecture/core/data/database_cats_repository.dart';
import 'package:demo_app_architecture/core/data/network_connection_repository.dart';
import 'package:demo_app_architecture/core/data/rest_api_cats_repository.dart';
import 'package:demo_app_architecture/core/domain/repositories/cats_repository.dart';
import 'package:demo_app_architecture/core/domain/repositories/connection_repository.dart';
import 'package:demo_app_architecture/core/domain/repositories/offline_cats_repository.dart';
import 'package:demo_app_architecture/core/domain/use_cases/connection_use_case.dart';
import 'package:demo_app_architecture/core/domain/use_cases/get_cats_from_database_use_case.dart';
import 'package:demo_app_architecture/core/domain/use_cases/get_cats_list_use_case.dart';
import 'package:demo_app_architecture/core/domain/use_cases/save_cats_to_database_use_case.dart';
import 'package:demo_app_architecture/dependency_injection/app_component.dart';
import 'package:demo_app_architecture/features/cats_list/cats_list_initial_params.dart';
import 'package:demo_app_architecture/features/cats_list/cats_list_page.dart';
import 'package:demo_app_architecture/features/cats_list/cats_list_presentation_model.dart';
import 'package:demo_app_architecture/features/cats_list/cats_list_presenter.dart';
//DO-NOT-REMOVE APP_COMPONENT_IMPORTS

/// registers all the dependencies in dependency graph in get_it package
void configureDependencies() {
  _configureGeneralDependencies();
  _configureRepositories();
  _configureStores();
  _configureUseCases();
  _configureMvp();
}

//ignore: long-method
void _configureGeneralDependencies() {
  // ignore: unnecessary_statements
  getIt
      //DO-NOT-REMOVE GENERAL_DEPS_GET_IT_CONFIG
      ;
}

//ignore: long-method
void _configureRepositories() {
  // ignore: unnecessary_statements
  getIt
        ..registerFactory<CatsRepository>(
          () => RestApiCatsRepository(
            getIt(),
          ),
        )
        ..registerFactory<OfflineCatsRepository>(
            () => DatabaseCatsRepository(getIt()))
        ..registerFactory<ConnectionRepository>(
            () => const NetworkConnectionRepository())
      //DO-NOT-REMOVE REPOSITORIES_GET_IT_CONFIG
      ;
}

//ignore: long-method
void _configureStores() {
  // ignore: unnecessary_statements
  getIt
      //DO-NOT-REMOVE STORES_GET_IT_CONFIG
      ;
}

//ignore: long-method
void _configureUseCases() {
  // ignore: unnecessary_statements
  getIt
    ..registerFactory<GetCatsFromDatabaseUseCase>(
        () => GetCatsFromDatabaseUseCase(getIt()))
    ..registerFactory<ConnectionUseCase>(() => ConnectionUseCase(getIt()))
    ..registerFactory<SaveCatsToDatabaseUseCase>(() => SaveCatsToDatabaseUseCase(getIt()))
    ..registerFactory<GetCatsListUseCase>(() => GetCatsListUseCase(getIt()));
}

//ignore: long-method
void _configureMvp() {
  getIt
    ..registerFactoryParam<CatsListPresentationModel, CatsListInitialParams,
        dynamic>(
      (params, _) => CatsListPresentationModel.initial(params),
    )
    ..registerFactoryParam<CatsListPresenter, CatsListInitialParams, dynamic>(
      (initialParams, _) => CatsListPresenter(
        getIt<CatsListPresentationModel>(param1: initialParams),
        getIt(),
        getIt(),
        getIt(),
        getIt(),
        getIt(),
      ),
    )
    ..registerFactoryParam<CatsListPage, CatsListInitialParams, dynamic>(
      (initialParams, _) => CatsListPage(
        presenter: getIt(param1: initialParams),
      ),
    );
}
