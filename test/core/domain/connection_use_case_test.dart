import 'package:flutter_test/flutter_test.dart';
import 'package:demo_app_architecture/core/utils/either_extensions.dart';
import 'package:demo_app_architecture/dependency_injection/app_component.dart';
import 'package:demo_app_architecture/core/domain/use_cases/connection_use_case.dart';
import 'package:mocktail/mocktail.dart';

import '../../mocks/mocks.dart';
import '../../test_utils/test_utils.dart';

void main() {
  late ConnectionUseCase useCase;

  setUp(() {
    useCase = ConnectionUseCase(Mocks.networkConnectionRepository);
  });

  test(
    'use case executes normally',
    () async {
      // GIVEN
      when(
        () => Mocks.networkConnectionRepository.isConnected(),
      ).thenAnswer((_) => successFuture(true));

      // WHEN
      final result = await useCase.execute();

      // THEN
      expect(result.isSuccess, true);
    },
  );

  test("getIt resolves successfully", () async {
    final useCase = getIt<ConnectionUseCase>();
    expect(useCase, isNotNull);
  });
}
