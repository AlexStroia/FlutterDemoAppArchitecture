import 'package:dartz/dartz.dart';
import 'package:demo_app_architecture/core/domain/model/cat.dart';
import 'package:demo_app_architecture/core/domain/model/get_cats_list_failure.dart';

abstract class CatsRepository {
  Future<Either<GetCatsListFailure, List<Cat>>> getCatsList();
}
