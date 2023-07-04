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
  //DO-NOT-REMOVE USE_CASES_GET_IT_CONFIG
      ;
}

//ignore: long-method
void _configureMvp() {
  getIt
    ..registerFactoryParam<CatsListPresentationModel,
        CatsListInitialParams, dynamic>(
          (params, _) => CatsListPresentationModel.initial(params),
    )
    ..registerFactoryParam<CatsListPresenter,
        CatsListInitialParams, dynamic>(
          (initialParams, _) => CatsListPresenter(
        getIt<CatsListPresentationModel>(param1: initialParams),
        getIt(),
      ),
    )
    ..registerFactoryParam<CatsListPage, CatsListInitialParams,
        dynamic>(
          (initialParams, _) => CatsListPage(
        presenter: getIt(param1: initialParams),
      ),
    );
}
