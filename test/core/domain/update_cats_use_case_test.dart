import 'package:flutter_test/flutter_test.dart';
import 'package:demo_app_architecture/core/utils/either_extensions.dart';
import 'package:demo_app_architecture/dependency_injection/app_component.dart';
import 'package:demo_app_architecture/core/domain/use_cases/update_cats_use_case.dart';

void main() {
  late UpdateCatsUseCase useCase;

  setUp(() {
    useCase = const UpdateCatsUseCase();
  });

  test(
    'use case executes normally',
    () async {
      // GIVEN

      // WHEN
      final result = await useCase.execute();

      // THEN
      expect(result.isSuccess, true);
    },
  );


  test("getIt resolves successfully", () async {
    final useCase = getIt<UpdateCatsUseCase>();
    expect(useCase, isNotNull);
  });
}
