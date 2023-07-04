import 'package:mocktail/mocktail.dart';

import 'mock_definitions.dart';

class Mocks {
  static late MockHttpClient mockHttpClient;
  static late MockAppRouter mockAppRouter;
  static late MockAppNavigator mockAppNavigator;

  static void init() {
    mockHttpClient = MockHttpClient();
    mockAppRouter = MockAppRouter();
    mockAppNavigator = MockAppNavigator();
    registerFallbackValue(MockHttpClient());
    registerFallbackValue(MockAppRouter());
    registerFallbackValue(MockAppNavigator());
  }
}
