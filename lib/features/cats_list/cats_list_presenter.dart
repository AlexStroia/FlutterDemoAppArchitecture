import 'package:bloc/bloc.dart';
import 'package:demo_app_architecture/features/cats_list/cats_list_presentation_model.dart';
import 'package:demo_app_architecture/router/app_navigator.dart';

class CatsListPresenter extends Cubit<CatsListViewModel> {

  CatsListPresenter(
    super.model,
    this.navigator,
  );

  final AppNavigator navigator;

  // ignore: unused_element
  CatsListPresentationModel get _model => state as CatsListPresentationModel;

}
