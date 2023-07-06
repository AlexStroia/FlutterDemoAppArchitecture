import 'package:dartz/dartz.dart';
import 'package:demo_app_architecture/core/domain/model/cat.dart';
import 'package:demo_app_architecture/core/domain/repositories/cats_repository.dart';
import 'package:demo_app_architecture/core/domain/model/get_cats_list_failure.dart';

class GetCatsListUseCase {
  final CatsRepository catsRepository;

  const GetCatsListUseCase(this.catsRepository);

  Future<Either<GetCatsListFailure, List<Cat>>> execute() =>
      catsRepository.getCatsList();
}
