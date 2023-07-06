import 'package:connectivity/connectivity.dart';
import 'package:dartz/dartz.dart';
import 'package:demo_app_architecture/core/data/network_connection_repository.dart';
import 'package:demo_app_architecture/core/domain/model/connection_failure.dart';
import 'package:demo_app_architecture/core/domain/repositories/connection_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../mocks/mocks.dart';

void main() {
  late ConnectionRepository repository;

  setUp(() {
    repository = NetworkConnectionRepository(Mocks.connectivity);
  });

  test('isConnected returns Right(true) when connected to the internet',
      () async {
    // Arrange
    when(() => Mocks.connectivity.checkConnectivity())
        .thenAnswer((_) async => ConnectivityResult.wifi);

    // Act
    final result = await repository.isConnected();

    // Assert
    expect(result, equals(const Right(true)));
  });

  test(
      'isConnected returns Left(ConnectionFailure.noInternet()) when not connected to the internet',
      () async {
    // Arrange
    when(() => Mocks.connectivity.checkConnectivity())
        .thenAnswer((_) async => ConnectivityResult.none);

    // Act
    final result = await repository.isConnected();

    // Assert
    expect(result, equals(const Left(ConnectionFailure.noInternet())));
  });

  test(
      'isConnected returns Left(ConnectionFailure.unknown()) when an exception occurs',
      () async {
    // Arrange
    when(() => Mocks.connectivity.checkConnectivity())
        .thenThrow(Exception('Test exception'));

    // Act
    final result = await repository.isConnected();

    // Assert
    expect(result, equals(const Left(ConnectionFailure.unknown())));
  });
}
