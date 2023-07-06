import 'package:demo_app_architecture/core/domain/model/displayable_failure.dart';

class GetCatsListFromDatabaseFailure implements HasDisplayableFailure {
  // ignore: avoid_field_initializers_in_const_classes
  const GetCatsListFromDatabaseFailure.unknown([this.cause])
      : type = GetCatsListFromDatabaseFailureType.unknown;
  const GetCatsListFromDatabaseFailure.databaseNotInitialized([this.cause])
      : type = GetCatsListFromDatabaseFailureType.databaseNotInitialized;

  final GetCatsListFromDatabaseFailureType type;
  final Object? cause;

  @override
  DisplayableFailure displayableFailure() {
    switch (type) {
      case GetCatsListFromDatabaseFailureType.unknown:
        return DisplayableFailure.commonError();
      case GetCatsListFromDatabaseFailureType.databaseNotInitialized:
        return DisplayableFailure.commonError('Database not initialized');
    }
  }

  @override
  String toString() =>
      'GetCatsListFromDatabaseFailure{type: $type, cause: $cause}';
}

enum GetCatsListFromDatabaseFailureType { unknown, databaseNotInitialized }
