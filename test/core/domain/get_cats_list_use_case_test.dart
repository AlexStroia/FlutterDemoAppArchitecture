import 'package:flutter_test/flutter_test.dart';
import 'package:demo_app_architecture/core/utils/either_extensions.dart';
import 'package:demo_app_architecture/dependency_injection/app_component.dart';
import 'package:demo_app_architecture/core/domain/use_cases/get_cats_list_use_case.dart';
import 'package:mocktail/mocktail.dart';

import '../../mocks/mocks.dart';
import '../../mocks/stubs.dart';
import '../../test_utils/test_utils.dart';

void main() {
  late GetCatsListUseCase useCase;

  setUp(() {
    useCase = GetCatsListUseCase(Mocks.restApiCatsRepository);
  });

  test(
    'use case executes normally',
    () async {
      // GIVEN
      when(
        () => Mocks.restApiCatsRepository.getCatsList(),
      ).thenAnswer((_) => successFuture(Stubs.cats));

      // WHEN
      final result = await useCase.execute();

      // THEN
      expect(result.isSuccess, true);
    },
  );

  test("getIt resolves successfully", () async {
    final useCase = getIt<GetCatsListUseCase>();
    expect(useCase, isNotNull);
  });
}
