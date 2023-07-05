import 'package:dartz/dartz.dart';
import 'package:demo_app_architecture/core/domain/model/cat.dart';
import 'package:demo_app_architecture/core/domain/model/get_cats_from_database_failure.dart';
import 'package:demo_app_architecture/core/domain/repositories/offline_cats_repository.dart';

class GetCatsFromDatabaseUseCase {
  final OfflineCatsRepository offlineCatsRepository;

  const GetCatsFromDatabaseUseCase(this.offlineCatsRepository);

  Future<Either<GetCatsListFromDatabaseFailure, List<Cat>>> execute() =>
      offlineCatsRepository.getCatsList();
}
