import 'package:mocktail/mocktail.dart';

import 'mock_definitions.dart';

class Mocks {
  static late MockHttpClient httpClient;
  static late MockAppRouter appRouter;
  static late MockAppNavigator appNavigator;

  static late MockDatabaseCatsRepository databaseCatsRepository;
  static late MockNetworkConnectionRepository networkConnectionRepository;
  static late MockRestApiCatsRepository restApiCatsRepository;

  static late MockConnectionUseCase connectionUseCase;
  static late MockGetCatsFromDatabaseUseCase getCatsFromDatabaseUseCase;
  static late MockGetCatsListUseCase getCatsListUseCase;
  static late MockSaveCatsToDatabaseUseCase saveCatsToDatabaseUseCase;
  static late MockUpdateCatsUseCase updateCatsUseCase;

  static void init() {
    httpClient = MockHttpClient();
    appRouter = MockAppRouter();
    appNavigator = MockAppNavigator();

    databaseCatsRepository = MockDatabaseCatsRepository();
    networkConnectionRepository = MockNetworkConnectionRepository();
    restApiCatsRepository = MockRestApiCatsRepository();

    connectionUseCase = MockConnectionUseCase();
    getCatsFromDatabaseUseCase = MockGetCatsFromDatabaseUseCase();
    getCatsListUseCase = MockGetCatsListUseCase();
    saveCatsToDatabaseUseCase = MockSaveCatsToDatabaseUseCase();
    updateCatsUseCase = MockUpdateCatsUseCase();

    registerFallbackValue(MockHttpClient());
    registerFallbackValue(MockAppRouter());
    registerFallbackValue(MockAppNavigator());

    registerFallbackValue(MockDatabaseCatsRepository());
    registerFallbackValue(MockNetworkConnectionRepository());
    registerFallbackValue(MockRestApiCatsRepository());

    registerFallbackValue(MockConnectionUseCase());
    registerFallbackValue(MockGetCatsFromDatabaseUseCase());
    registerFallbackValue(MockGetCatsListUseCase());
    registerFallbackValue(MockSaveCatsToDatabaseUseCase());
    registerFallbackValue(MockUpdateCatsUseCase());
  }
}
