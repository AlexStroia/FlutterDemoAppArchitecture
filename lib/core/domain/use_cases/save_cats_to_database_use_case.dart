import 'package:dartz/dartz.dart';
import 'package:demo_app_architecture/core/domain/model/add_cats_failure.dart';
import 'package:demo_app_architecture/core/domain/model/cat.dart';
import 'package:demo_app_architecture/core/domain/repositories/offline_cats_repository.dart';

class SaveCatsToDatabaseUseCase {
  final OfflineCatsRepository offlineCatsRepository;

  const SaveCatsToDatabaseUseCase(this.offlineCatsRepository);

  Future<Either<SaveCatsToDatabaseFailure, int>> execute(List<Cat> cats) =>
      offlineCatsRepository.add(cats.map((cat) => cat.toJson()).toList());
}
