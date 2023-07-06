import 'package:demo_app_architecture/core/domain/model/displayable_failure.dart';

class ConnectionFailure implements HasDisplayableFailure {
  // ignore: avoid_field_initializers_in_const_classes
  const ConnectionFailure.noInternet([this.cause])
      : type = ConnectionFailureType.noInternet;

  const ConnectionFailure.unknown([this.cause])
      : type = ConnectionFailureType.unknown;

  final ConnectionFailureType type;
  final Object? cause;

  @override
  DisplayableFailure displayableFailure() {
    switch (type) {
      case ConnectionFailureType.noInternet:
        return DisplayableFailure.commonError(
            'No internet connection. Showing Cached Data if there are any. If not switch internet on and off and data will be available');
      case ConnectionFailureType.unknown:
        return DisplayableFailure.commonError();
    }
  }

  @override
  String toString() => 'ConnectionFailure{type: $type, cause: $cause}';
}

enum ConnectionFailureType {
  unknown,
  noInternet,
}
