import 'package:flutter_test/flutter_test.dart';
import 'package:demo_app_architecture/dependency_injection/app_component.dart';
import 'package:demo_app_architecture/features/cats_list/cats_list_initial_params.dart';
import 'package:demo_app_architecture/features/cats_list/cats_list_page.dart';
import 'package:demo_app_architecture/features/cats_list/cats_list_presentation_model.dart';
import 'package:demo_app_architecture/features/cats_list/cats_list_presenter.dart';
import 'package:demo_app_architecture/router/app_navigator.dart';
import 'package:mocktail/mocktail.dart';

import '../../../mocks/mocks.dart';
import '../../../mocks/stubs.dart';
import '../../../test_utils/golden_tests_utils.dart';
import '../../../test_utils/test_utils.dart';

//CI AND MACOS NOT CONFIGURED
Future<void> main() async {
  late CatsListPage page;
  late CatsListInitialParams initParams;
  late CatsListPresentationModel model;
  late CatsListPresenter presenter;
  late AppNavigator navigator;

  void initMvp() {
    initParams = const CatsListInitialParams();
    model = CatsListPresentationModel.initial(
      initParams,
    );
    navigator = AppNavigator(Mocks.appRouter);
    presenter = CatsListPresenter(
      model,
      navigator,
      Mocks.getCatsListUseCase,
      Mocks.getCatsFromDatabaseUseCase,
      Mocks.saveCatsToDatabaseUseCase,
      Mocks.connectionUseCase,
    );
    page = CatsListPage(presenter: presenter);

    when(() => Mocks.getCatsListUseCase.execute())
        .thenAnswer((_) => successFuture(Stubs.cats));
    when(() => Mocks.getCatsFromDatabaseUseCase.execute())
        .thenAnswer((_) => successFuture(Stubs.cats));
    when(() => Mocks.saveCatsToDatabaseUseCase.execute(any()))
        .thenAnswer((_) => successFuture(1));
    when(() => Mocks.connectionUseCase.execute())
        .thenAnswer((_) => successFuture(true));
  }

  await screenshotTest(
    "cats_list_page",
    setUp: () async {
      initMvp();
    },
    pageBuilder: () => page,
  );

  // await goldenTest(
  //   "cats_list_page",
  //   builder: () {
  //     initMvp();
  //     return page;
  //   },
  //   pumpWidget: (tester, widget) async {
  //     // You can perform any additional setup or operations before pumping the widget if needed
  //     await tester.pumpWidget(widget);
  //   },
  // );

  test("getIt page resolves successfully", () async {
    initMvp();
    final page = getIt<CatsListPage>(param1: initParams);
    expect(page.presenter, isNotNull);
    expect(page, isNotNull);
  });
}
