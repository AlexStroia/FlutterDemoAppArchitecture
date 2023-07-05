import 'package:dartz/dartz.dart';
import 'package:demo_app_architecture/core/utils/either_extensions.dart';
import 'package:demo_app_architecture/core/domain/model/update_cats_failure.dart';

//Currently Not Used
class UpdateCatsUseCase {
  const UpdateCatsUseCase();

  Future<Either<UpdateCatsFailure, Unit>> execute() async {
    return failure(const UpdateCatsFailure.unknown());
  }
}
