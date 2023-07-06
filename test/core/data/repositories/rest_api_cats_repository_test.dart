import 'package:dartz/dartz.dart';
import 'package:demo_app_architecture/core/api_constants.dart';
import 'package:demo_app_architecture/core/data/rest_api_cats_repository.dart';
import 'package:demo_app_architecture/core/domain/model/cat.dart';
import 'package:demo_app_architecture/core/domain/model/network_failure.dart';
import 'package:demo_app_architecture/core/domain/repositories/cats_repository.dart';
import 'package:demo_app_architecture/core/utils/either_extensions.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mocktail/mocktail.dart';

import '../../../mocks/mocks.dart';
import '../../../mocks/stubs.dart';

void main() {
  late CatsRepository repository;

  setUp(() {
    repository = RestApiCatsRepository(Mocks.httpClient);
  });

  group('getCatsList', () {
    test('returns Right with a list of cats on successful API response',
        () async {
      // GIVEN
      when(() => Mocks.httpClient.get(path: ApiConstants.cats)).thenAnswer(
          (_) async => Right(Response(Stubs.catsResponseBody, 200)));

      // THEN
      final result = await repository.getCatsList();

      // EXPECT
      expect(
          result,
          equals(const Right([
            Cat(
              tags: ['playful', 'tabby', 'striped'],
              id: '4',
              owner: 'Bob Thompson',
              createdAt: '2022-01-07',
              updatedAt: '2022-01-08',
            ),
          ])));
    });

    test(
        'throws GetCatsListFailure.unknown when encountering an unknown API failure',
        () async {
      // GIVEN
      when(() => Mocks.httpClient.get(path: ApiConstants.cats))
          .thenAnswer((_) async => const Left(NetworkFailure.unknown()));

      // THEN
      final result = await repository.getCatsList();

      // EXPECT
      expect(result.getFailure(), isNotNull);
    });
  });
}
