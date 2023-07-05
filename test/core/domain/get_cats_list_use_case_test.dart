import 'package:flutter_test/flutter_test.dart';
import 'package:demo_app_architecture/core/utils/either_extensions.dart';
import 'package:demo_app_architecture/dependency_injection/app_component.dart';
import 'package:demo_app_architecture/core/domain/use_cases/get_cats_list_use_case.dart';

void main() {
  late GetCatsListUseCase useCase;

  setUp(() {
    useCase = const GetCatsListUseCase();
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
    final useCase = getIt<GetCatsListUseCase>();
    expect(useCase, isNotNull);
  });
}
