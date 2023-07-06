import 'package:demo_app_architecture/core/domain/model/displayable_failure.dart';

class DatabaseFailure implements HasDisplayableFailure {
  // ignore: avoid_field_initializers_in_const_classes
  const DatabaseFailure.unknown([this.cause])
      : type = DatabaseFailureType.unknown;
  const DatabaseFailure.databaseNotInitialized([this.cause])
      : type = DatabaseFailureType.databaseNotInitialized;

  final DatabaseFailureType type;
  final Object? cause;

  @override
  DisplayableFailure displayableFailure() {
    switch (type) {
      case DatabaseFailureType.unknown:
        return DisplayableFailure.commonError();
      case DatabaseFailureType.databaseNotInitialized:
        return DisplayableFailure.commonError('Database not initialized');
    }
  }

  @override
  String toString() => 'GetCatsFromDatabaseFailure{type: $type, cause: $cause}';
}

enum DatabaseFailureType {
  unknown,
  databaseNotInitialized,
}
