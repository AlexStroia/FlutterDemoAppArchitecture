import 'package:connectivity/connectivity.dart';
import 'package:dartz/dartz.dart';
import 'package:demo_app_architecture/core/domain/model/connection_failure.dart';
import 'package:demo_app_architecture/core/domain/repositories/connection_repository.dart';

class NetworkConnectionRepository implements ConnectionRepository {
  const NetworkConnectionRepository();

  @override
  Future<Either<ConnectionFailure, bool>> isConnected() async {
    try {
      final connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult == ConnectivityResult.none) {
        return const Left(ConnectionFailure.noInternet());
      } else if (connectivityResult == ConnectivityResult.mobile ||
          connectivityResult == ConnectivityResult.wifi) {
        return const Right(true);
      }
      return const Left(ConnectionFailure.unknown());
    } catch (_) {
      return const Left(ConnectionFailure.unknown());
    }
  }
}
