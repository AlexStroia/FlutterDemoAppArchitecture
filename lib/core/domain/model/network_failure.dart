import 'package:demo_app_architecture/core/domain/model/displayable_failure.dart';

class NetworkFailure implements HasDisplayableFailure {
  const NetworkFailure.unknown([this.cause])
      : type = NetworkFailureType.unknown;

  const NetworkFailure.unauthenticated([this.cause])
      : type = NetworkFailureType.unautehnticated;
  final NetworkFailureType type;
  final Object? cause;

  @override
  DisplayableFailure displayableFailure() {
    throw UnimplementedError();
  }
}

enum NetworkFailureType {
  unknown,
  unautehnticated,
}
