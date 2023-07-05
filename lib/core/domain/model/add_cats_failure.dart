import 'package:demo_app_architecture/core/domain/model/displayable_failure.dart';

class SaveCatsToDatabaseFailure implements HasDisplayableFailure {
  // ignore: avoid_field_initializers_in_const_classes
  const SaveCatsToDatabaseFailure.unknown([this.cause])
      : type = SaveCatsToDatabaseFailureType.unknown;

  const SaveCatsToDatabaseFailure.databaseNotInitialized([this.cause])
      : type = SaveCatsToDatabaseFailureType.databaseNotInitialized;

  final SaveCatsToDatabaseFailureType type;
  final Object? cause;

  @override
  DisplayableFailure displayableFailure() {
    switch (type) {
      case SaveCatsToDatabaseFailureType.unknown:
        return DisplayableFailure.commonError();
      case SaveCatsToDatabaseFailureType.databaseNotInitialized:
        return DisplayableFailure.commonError('Database not initialized');
    }
  }

  @override
  String toString() => 'AddCatsFailure{type: $type, cause: $cause}';
}

enum SaveCatsToDatabaseFailureType { unknown, databaseNotInitialized }
