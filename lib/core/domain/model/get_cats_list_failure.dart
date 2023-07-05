import 'package:demo_app_architecture/core/domain/model/displayable_failure.dart';

class GetCatsListFailure implements HasDisplayableFailure {
  // ignore: avoid_field_initializers_in_const_classes
  const GetCatsListFailure.unknown([this.cause]) : type = GetCatsListFailureType.unknown;

  final GetCatsListFailureType type;
  final Object? cause;

  @override
  DisplayableFailure displayableFailure() {
    switch (type) {
      case GetCatsListFailureType.unknown:
        return DisplayableFailure.commonError();
    }
  }

  @override
  String toString() => 'GetCatsListFailure{type: $type, cause: $cause}';
}

enum GetCatsListFailureType {
  unknown,
}
