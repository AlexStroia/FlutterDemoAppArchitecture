import 'package:demo_app_architecture/core/domain/model/connection_failure.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:demo_app_architecture/features/cats_list/cats_list_initial_params.dart';
import 'package:demo_app_architecture/features/cats_list/cats_list_presentation_model.dart';
import 'package:demo_app_architecture/features/cats_list/cats_list_presenter.dart';
import 'package:mocktail/mocktail.dart';

import '../../../mocks/mock_definitions.dart';
import '../../../mocks/mocks.dart';
import '../../../mocks/stubs.dart';
import '../../../test_utils/test_utils.dart';

void main() {
  late CatsListPresentationModel model;
  late CatsListPresenter presenter;
  late MockAppNavigator navigator;

  test(
    'sample test',
    () {
      expect(presenter, isNotNull);
    },
  );

  test('getCatsList should execute getCatsListUseCase', () async {
    // GIVEN
    when(() => Mocks.connectionUseCase.execute())
        .thenAnswer((_) => successFuture(true));
    when(() => Mocks.getCatsListUseCase.execute())
        .thenAnswer((_) => successFuture(Stubs.cats));
    when(() => Mocks.getCatsListUseCase.execute())
        .thenAnswer((_) => successFuture(Stubs.cats));
    // WHEN
    await presenter.getCatsList();

    // THEN
    verify(() => Mocks.getCatsListUseCase.execute());
  });

  test('getCatsList should execute call saveDataToDatabaseUseCase', () async {
    //GIVEN
    when(() => Mocks.connectionUseCase.execute())
        .thenAnswer((_) => successFuture(true));
    when(() => Mocks.getCatsListUseCase.execute())
        .thenAnswer((_) async => successFuture(Stubs.cats));
    when(() => Mocks.saveCatsToDatabaseUseCase.execute(Stubs.cats))
        .thenAnswer((_) async => successFuture(Stubs.cats.length));

    // THEN
    await presenter.getCatsList();

    // WHEN
    verify(() => Mocks.saveCatsToDatabaseUseCase.execute(Stubs.cats));
  });

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
    registerFallbackValue(const ConnectionFailure.unknown());

    when(() => Mocks.getCatsListUseCase.execute())
        .thenAnswer((_) => successFuture(Stubs.cats));
    when(() => Mocks.getCatsFromDatabaseUseCase.execute())
        .thenAnswer((_) => successFuture(Stubs.cats));
    when(() => Mocks.saveCatsToDatabaseUseCase.execute(any()))
        .thenAnswer((_) => successFuture(1));
    when(() => navigator.showError(Stubs.connFailure.displayableFailure()))
        .thenAnswer((_) => Future<void>.value());
  });
}
