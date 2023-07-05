import 'package:bloc/bloc.dart';
import 'package:demo_app_architecture/core/domain/use_cases/get_cats_list_use_case.dart';
import 'package:demo_app_architecture/features/cats_list/cats_list_presentation_model.dart';
import 'package:demo_app_architecture/router/app_navigator.dart';

class CatsListPresenter extends Cubit<CatsListViewModel> {
  CatsListPresenter(
    super.model,
    this.navigator,
    this._getCatsListUseCase,
  );

  final AppNavigator navigator;
  final GetCatsListUseCase _getCatsListUseCase;

  // ignore: unused_element
  CatsListPresentationModel get _model => state as CatsListPresentationModel;
}
