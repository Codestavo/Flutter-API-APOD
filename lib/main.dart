import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nasa_space_view/core/coordinator/app_routes.dart';
import 'package:nasa_space_view/core/inject/app_inject.dart';
import 'package:nasa_space_view/core/inject/inject.dart';
import 'package:package_info_plus/package_info_plus.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  AppInject.iniciar();
  _initApp();
}

Future<void> _initApp() async {
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  ErrorWidget.builder = (FlutterErrorDetails details) => Builder(
        builder: (context) => Container(),
      );
  final dataApp = await PackageInfo.fromPlatform();
  runApp(MyApp(dataApp));
}

class MyApp extends StatefulWidget {
  final PackageInfo app;
  const MyApp(this.app, {Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final navigatorKey = Inject.get<GlobalKey<NavigatorState>>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      title: 'Astronomy Picture of the Day',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: AppRoutes.home.route,
      onGenerateRoute: AppRoutes.onGenerateRoute,
      locale: const Locale('en'),
      supportedLocales: const [Locale('en')],
    );
  }
}
