import 'package:flutter_test/flutter_test.dart';
import 'package:demo_app_architecture/core/utils/either_extensions.dart';
import 'package:demo_app_architecture/dependency_injection/app_component.dart';
import 'package:demo_app_architecture/core/domain/use_cases/save_cats_to_database_use_case.dart';

import '../../mocks/mocks.dart';
import '../../mocks/stubs.dart';

void main() {
  late SaveCatsToDatabaseUseCase useCase;

  setUp(() {
    useCase = SaveCatsToDatabaseUseCase(Mocks.databaseCatsRepository);
  });

  test(
    'use case executes normally',
    () async {
      // GIVEN

      // WHEN
      final result = await useCase.execute(Stubs.cats);

      // THEN
      expect(result.isSuccess, true);
    },
  );

  test("getIt resolves successfully", () async {
    final useCase = getIt<SaveCatsToDatabaseUseCase>();
    expect(useCase, isNotNull);
  });
}
