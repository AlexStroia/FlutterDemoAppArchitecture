import 'package:flutter_test/flutter_test.dart';
import 'package:demo_app_architecture/dependency_injection/app_component.dart';
import 'package:demo_app_architecture/features/cats_list/cats_list_initial_params.dart';
import 'package:demo_app_architecture/features/cats_list/cats_list_page.dart';
import 'package:demo_app_architecture/features/cats_list/cats_list_presentation_model.dart';
import 'package:demo_app_architecture/features/cats_list/cats_list_presenter.dart';
import 'package:demo_app_architecture/router/app_navigator.dart';

import '../../../test/mocks/mocks.dart';
import '../../../test/test_utils/golden_tests_utils.dart';

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
    navigator = AppNavigator(Mocks.mockAppRouter);
    presenter = CatsListPresenter(
      model,
      navigator,
    );
    page = CatsListPage(presenter: presenter);
  }

  await screenshotTest(
    "cats_list_page",
    setUp: () async {
      initMvp();
    },
    pageBuilder: () => page,
  );

  test("getIt page resolves successfully", () async {
    initMvp();
    final page = getIt<CatsListPage>(param1: initParams);
    expect(page.presenter, isNotNull);
    expect(page, isNotNull);
  });
}
