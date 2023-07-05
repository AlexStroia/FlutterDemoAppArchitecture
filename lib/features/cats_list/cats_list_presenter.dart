import 'package:bloc/bloc.dart';
import 'package:demo_app_architecture/core/domain/model/cat.dart';
import 'package:demo_app_architecture/core/domain/model/displayable_failure.dart';
import 'package:demo_app_architecture/core/domain/use_cases/connection_use_case.dart';
import 'package:demo_app_architecture/core/domain/use_cases/get_cats_from_database_use_case.dart';
import 'package:demo_app_architecture/core/domain/use_cases/get_cats_list_use_case.dart';
import 'package:demo_app_architecture/core/domain/use_cases/save_cats_to_database_use_case.dart';
import 'package:demo_app_architecture/core/utils/either_extensions.dart';
import 'package:demo_app_architecture/features/cats_list/cats_list_presentation_model.dart';
import 'package:demo_app_architecture/router/app_navigator.dart';

class CatsListPresenter extends Cubit<CatsListViewModel> {
  CatsListPresenter(
    super.model,
    this.navigator,
    this._getCatsListUseCase,
    this._getCatsFromDatabaseUseCase,
    this._saveCatsToDatabaseUseCase,
    this._getConnectionUseCase,
  );

  final AppNavigator navigator;
  final GetCatsListUseCase _getCatsListUseCase;
  final GetCatsFromDatabaseUseCase _getCatsFromDatabaseUseCase;
  final SaveCatsToDatabaseUseCase _saveCatsToDatabaseUseCase;
  final ConnectionUseCase _getConnectionUseCase;

  // ignore: unused_element
  CatsListPresentationModel get _model => state as CatsListPresentationModel;

  void getCatsList() {
    _getConnectionUseCase.execute().doOn(success: (isConnected) {
      if (isConnected) {
        _getCatsList();
      } else {
        emit(_model.copyWith(isLoading: false));
      }
    }, fail: (failure) {
      navigator.showError(failure.displayableFailure());
      _getCatsFromDatabase();
    });
  }

  void _getCatsList() {
    emit(_model.copyWith(isLoading: true));
    _getCatsListUseCase.execute().doOn(success: (catsList) async {
      _saveCatsToDatabase(catsList);
    }, fail: (failure) {
      emit(_model.copyWith(isLoading: false));
      navigator.showError(failure.displayableFailure());
    });
  }

  void _saveCatsToDatabase(List<Cat> catsList) {
    _saveCatsToDatabaseUseCase.execute(catsList).doOn(success: (_) {
      emit(_model.copyWith(isLoading: false, catsList: catsList));
    }, fail: (failure) {
      emit(_model.copyWith(isLoading: false));
      navigator.showError(failure.displayableFailure());
    });
  }

  void _getCatsFromDatabase() {
    emit(_model.copyWith(isLoading: true));
    _getCatsFromDatabaseUseCase.execute().doOn(success: (catsList) {
      if (catsList.isEmpty) {
        navigator.showError(
            DisplayableFailure(title: 'No Data', message: 'No data found'));
      } else {
        emit(
          _model.copyWith(isLoading: false, catsList: catsList),
        );
      }
    }, fail: (failure) {
      emit(_model.copyWith(isLoading: false));
      navigator.showError(failure.displayableFailure());
    });
  }
}
