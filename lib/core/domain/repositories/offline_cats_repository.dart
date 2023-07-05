import 'package:dartz/dartz.dart';
import 'package:demo_app_architecture/core/domain/model/add_cats_failure.dart';
import 'package:demo_app_architecture/core/domain/model/cat.dart';
import 'package:demo_app_architecture/core/domain/model/get_cats_from_database_failure.dart';
import 'package:demo_app_architecture/core/domain/model/update_cats_failure.dart';

abstract class OfflineCatsRepository {
  Future<Either<GetCatsListFromDatabaseFailure, List<Cat>>> getCatsList();

  Future<Either<UpdateCatsFailure, int>> update(
      Map<String, dynamic> body, String id);

  Future<Either<SaveCatsToDatabaseFailure, int>> add(dynamic body);
}
