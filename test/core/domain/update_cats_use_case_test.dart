import 'package:demo_app_architecture/core/domain/use_cases/update_cats_to_database_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:demo_app_architecture/dependency_injection/app_component.dart';

void main() {
  late UpdateCatsToDatabaseUseCase useCase;

  setUp(() {
    useCase = const UpdateCatsToDatabaseUseCase();
  });

  test("getIt resolves successfully", () async {
    final useCase = getIt<UpdateCatsToDatabaseUseCase>();
    expect(useCase, isNotNull);
  });
}
