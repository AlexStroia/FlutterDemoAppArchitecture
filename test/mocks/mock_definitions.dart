import 'package:connectivity/connectivity.dart';
import 'package:demo_app_architecture/core/domain/database/database_client.dart';
import 'package:demo_app_architecture/core/domain/networking/networking_client.dart';
import 'package:demo_app_architecture/core/domain/repositories/cats_repository.dart';
import 'package:demo_app_architecture/core/domain/repositories/connection_repository.dart';
import 'package:demo_app_architecture/core/domain/repositories/offline_cats_repository.dart';
import 'package:demo_app_architecture/core/domain/use_cases/connection_use_case.dart';
import 'package:demo_app_architecture/core/domain/use_cases/get_cats_from_database_use_case.dart';
import 'package:demo_app_architecture/core/domain/use_cases/get_cats_list_use_case.dart';
import 'package:demo_app_architecture/core/domain/use_cases/save_cats_to_database_use_case.dart';
import 'package:demo_app_architecture/core/domain/use_cases/update_cats_to_database_use_case.dart';
import 'package:demo_app_architecture/router/app_navigator.dart';
import 'package:demo_app_architecture/router/app_router.dart';
import 'package:mocktail/mocktail.dart';

class MockHttpClient extends Mock implements NetworkClient {}

class MockConnectivity extends Mock implements Connectivity {}

class MockDatabaseClient extends Mock implements DatabaseClient {}

class MockAppRouter extends Mock implements AppRouter {}

class MockAppNavigator extends Mock implements AppNavigator {}

class MockDatabaseCatsRepository extends Mock
    implements OfflineCatsRepository {}

class MockNetworkConnectionRepository extends Mock
    implements ConnectionRepository {}

class MockRestApiCatsRepository extends Mock implements CatsRepository {}

class MockConnectionUseCase extends Mock implements ConnectionUseCase {}

class MockGetCatsFromDatabaseUseCase extends Mock
    implements GetCatsFromDatabaseUseCase {}

class MockGetCatsListUseCase extends Mock implements GetCatsListUseCase {}

class MockSaveCatsToDatabaseUseCase extends Mock
    implements SaveCatsToDatabaseUseCase {}

class MockUpdateCatsUseCase extends Mock
    implements UpdateCatsToDatabaseUseCase {}
