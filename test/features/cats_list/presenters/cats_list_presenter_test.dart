import 'package:flutter_test/flutter_test.dart';
import 'package:demo_app_architecture/features/cats_list/cats_list_initial_params.dart';
import 'package:demo_app_architecture/features/cats_list/cats_list_presentation_model.dart';
import 'package:demo_app_architecture/features/cats_list/cats_list_presenter.dart';

import '../../../mocks/mock_definitions.dart';
import '../../../mocks/mocks.dart';

void main() {
  late CatsListPresentationModel model;
  late CatsListPresenter presenter;
  late MockAppNavigator navigator;

  test(
    'sample test',
    () {
      expect(presenter, isNotNull); // TODO implement this
    },
  );

  setUp(() {
    model = CatsListPresentationModel.initial(const CatsListInitialParams());
    navigator = MockAppNavigator();
    presenter = CatsListPresenter(
      model,
      navigator,
      Mocks.getCatsListUseCase,
      Mocks.getCatsFromDatabaseUseCase,
      Mocks.saveCatsToDatabaseUseCase,
      Mocks.connectionUseCase,
    );
  });
}
