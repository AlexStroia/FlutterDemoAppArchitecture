import 'package:dartz/dartz.dart';
import 'package:demo_app_architecture/core/domain/model/connection_failure.dart';

abstract class ConnectionRepository {

  Future<Either<ConnectionFailure, bool>> isConnected();

}