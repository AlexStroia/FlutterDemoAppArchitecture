import 'package:demo_app_architecture/core/domain/model/displayable_failure.dart';

class NetworkFailure implements HasDisplayableFailure {
  @override
  DisplayableFailure displayableFailure() {
    throw UnimplementedError();
  }
}

enum NetworkFailureType {
  unknown,
  unautehnticated,
}