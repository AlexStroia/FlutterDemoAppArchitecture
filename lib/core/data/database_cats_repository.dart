import 'package:dartz/dartz.dart';
import 'package:demo_app_architecture/core/database_constants.dart';
import 'package:demo_app_architecture/core/domain/database/database_client.dart';
import 'package:demo_app_architecture/core/domain/model/add_cats_failure.dart';
import 'package:demo_app_architecture/core/domain/model/cat.dart';
import 'package:demo_app_architecture/core/domain/model/database_failure.dart';
import 'package:demo_app_architecture/core/domain/model/get_cats_from_database_failure.dart';
import 'package:demo_app_architecture/core/domain/model/update_cats_failure.dart';
import 'package:demo_app_architecture/core/domain/repositories/offline_cats_repository.dart';
import 'package:demo_app_architecture/core/utils/either_extensions.dart';

class DatabaseCatsRepository implements OfflineCatsRepository {
  final DatabaseClient databaseClient;

  const DatabaseCatsRepository(this.databaseClient);

  @override
  Future<Either<GetCatsListFromDatabaseFailure, List<Cat>>> getCatsList() {
    return databaseClient.getAll(DatabaseConstants.cats).mapSuccess((response) {
      final catsData = response;
      final cats =
          catsData.map((catData) => Cat.fromDatabase(catData)).toList();
      return cats;
    }).mapFailure((fail) {
      switch (fail) {
        case DatabaseFailure.unknown:
          return const GetCatsListFromDatabaseFailure.unknown();
        case DatabaseFailure.databaseNotInitialized:
          return const GetCatsListFromDatabaseFailure.databaseNotInitialized();
        default:
          return const GetCatsListFromDatabaseFailure.unknown();
      }
    });
  }

  @override
  Future<Either<UpdateCatsFailure, int>> update(
      Map<String, dynamic> body, String id) {
    return databaseClient
        .update(DatabaseConstants.cats, body, id)
        .mapSuccess((response) {
      return response;
    }).mapFailure((fail) {
      switch (fail) {
        case DatabaseFailure.unknown:
          return const UpdateCatsFailure.unknown();
        case DatabaseFailure.databaseNotInitialized:
          return const UpdateCatsFailure.databaseNotInitialized();
        default:
          return const UpdateCatsFailure.unknown();
      }
    });
  }

  @override
  Future<Either<SaveCatsToDatabaseFailure, int>> add(dynamic body) {
    return databaseClient
        .add(DatabaseConstants.cats, body)
        .mapSuccess((response) => response)
        .mapFailure((fail) {
      switch (fail) {
        case DatabaseFailure.unknown:
          return const SaveCatsToDatabaseFailure.unknown();
        case DatabaseFailure.databaseNotInitialized:
          return const SaveCatsToDatabaseFailure.databaseNotInitialized();
        default:
          return const SaveCatsToDatabaseFailure.unknown();
      }
    });
  }
}
