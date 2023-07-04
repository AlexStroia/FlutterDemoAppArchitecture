import 'package:demo_app_architecture/dependency_injection/app_component.dart';
import 'package:demo_app_architecture/features/cats_list/dependency_injection/feature_component.dart';
import 'package:demo_app_architecture/router/app_router.dart';
import 'package:demo_app_architecture/theme/app_theme.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initDependencies();
  await getIt.allReady();

  runApp(const DemoApp());
}

class DemoApp extends StatelessWidget {
  const DemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    final router = getIt<AppRouter>();
    return MaterialApp.router(
      theme: Theme.of(context).copyWith(extensions: [AppTheme()]),
      routerConfig: router,
    );
  }
}

