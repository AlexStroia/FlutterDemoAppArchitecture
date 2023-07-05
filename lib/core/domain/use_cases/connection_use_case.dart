import 'package:dartz/dartz.dart';
import 'package:demo_app_architecture/core/domain/repositories/connection_repository.dart';
import 'package:demo_app_architecture/core/domain/model/connection_failure.dart';

class ConnectionUseCase {
  final ConnectionRepository connectionRepository;
  const ConnectionUseCase(this.connectionRepository);

  Future<Either<ConnectionFailure, bool>> execute() => connectionRepository.isConnected();
}
