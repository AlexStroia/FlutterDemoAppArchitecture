import 'package:demo_app_architecture/core/domain/model/displayable_failure.dart';

class UpdateCatsFailure implements HasDisplayableFailure {
  // ignore: avoid_field_initializers_in_const_classes
  const UpdateCatsFailure.unknown([this.cause]) : type = UpdateCatsFailureType.unknown;

  const UpdateCatsFailure.databaseNotInitialized([this.cause])
      : type = UpdateCatsFailureType.databaseNotInitialized;

  final UpdateCatsFailureType type;
  final Object? cause;

  @override
  DisplayableFailure displayableFailure() {
    switch (type) {
      case UpdateCatsFailureType.unknown:
        return DisplayableFailure.commonError();
      case UpdateCatsFailureType.databaseNotInitialized:
        return DisplayableFailure.commonError('Database not initialized');
    }
  }

  @override
  String toString() => 'UpdateCatsFailure{type: $type, cause: $cause}';
}

enum UpdateCatsFailureType {
  unknown,
  databaseNotInitialized
}
