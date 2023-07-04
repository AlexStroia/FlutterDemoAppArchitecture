import 'package:demo_app_architecture/core/domain/networking/networking_client.dart';
import 'package:demo_app_architecture/router/app_navigator.dart';
import 'package:demo_app_architecture/router/app_router.dart';
import 'package:mocktail/mocktail.dart';

class MockHttpClient extends Mock implements NetworkClient {}

class MockAppRouter extends Mock implements AppRouter {}

class MockAppNavigator extends Mock implements AppNavigator {}
