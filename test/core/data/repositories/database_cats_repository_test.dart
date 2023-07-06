import 'package:dartz/dartz.dart';
import 'package:demo_app_architecture/core/data/database_cats_repository.dart';
import 'package:demo_app_architecture/core/database_constants.dart';
import 'package:demo_app_architecture/core/domain/model/add_cats_failure.dart';
import 'package:demo_app_architecture/core/domain/model/database_failure.dart';
import 'package:demo_app_architecture/core/domain/repositories/offline_cats_repository.dart';
import 'package:demo_app_architecture/core/utils/either_extensions.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../mocks/mocks.dart';
import '../../../mocks/stubs.dart';
import '../../../test_utils/test_utils.dart';

void main() {
  late OfflineCatsRepository repository;

  setUp(() {
    repository = DatabaseCatsRepository(Mocks.databaseClient);
  });

  group('getCatsList', () {
    test('returns Right with a list of cats on successful database response',
        () async {
      // GIVEN
      when(() => Mocks.databaseClient.getAll(any()))
          .thenAnswer((_) async => successFuture(Stubs.catsDataDynamic));

      // THEN
      final result = await repository.getCatsList();

      // EXPECT
      expect(result.getFailure(), isNull);
      expect(result.getSuccess(), isNotNull);
      // expect(
      //   result.getSuccess()!.length,
      //   Stubs.catsDataDynamic.length,
      // );
      // expect(result.getSuccess()!.first.owner,
      //     Stubs.catsDataDynamic.first['owner']);
    });

    test(
        'returns Left(GetCatsListFromDatabaseFailure.unknown) when encountering an unknown database failure',
        () async {
      // GIVEN
      when(() => Mocks.databaseClient.getAll(DatabaseConstants.cats))
          .thenAnswer((_) async => const Left(DatabaseFailure.unknown()));

      // THEN
      final result = await repository.getCatsList();

      // EXPECT
      expect(result.getFailure(), isNotNull);
      expect(result.getSuccess(), isNull);
    });

    test(
        'returns Left(GetCatsListFromDatabaseFailure.databaseNotInitialized) when the database is not initialized',
        () async {
      // GIVEN
      when(() => Mocks.databaseClient.getAll(DatabaseConstants.cats))
          .thenAnswer((_) async =>
              failFuture(const DatabaseFailure.databaseNotInitialized()));

      // THEN
      final result = await repository.getCatsList();

      // EXPECT
      expect(result.isFailure, true);
    });
  });

  group('add', () {
    test('returns Right with the response on successful database add',
        () async {
      // GIVEN
      when(() => Mocks.databaseClient.add(DatabaseConstants.cats, Stubs.cats))
          .thenAnswer((_) async => const Right(1));

      // THEN
      final result = await repository.add(Stubs.cats);

      // EXPECT
      expect(result, equals(const Right(1)));
    });

    test(
        'returns Left(SaveCatsToDatabaseFailure.unknown) when encountering an unknown database failure',
        () async {
      // GIVEN
      when(() => Mocks.databaseClient.add(DatabaseConstants.cats, Stubs.cats))
          .thenAnswer((_) async => const Left(DatabaseFailure.unknown()));

      // THEN
      final result = await repository.add(Stubs.cats);

      // EXPECT
      expect(result, equals(const Left(SaveCatsToDatabaseFailure.unknown())));
    });
  });
}
