import 'package:flutter/material.dart';
import 'package:nasa_space_view/features/space_view/presenter/pages/apod/apod_page.dart';
import 'package:nasa_space_view/features/space_view/presenter/pages/home/home_page.dart';

enum AppRoutes {
  home('/'),
  apod('/apod_page');

  const AppRoutes(this.route);

  final String route;
  static final Map<String, WidgetBuilder> routes = {
    home.route: (context) => const HomePage(),
    apod.route: (context) => const ApodPage(),
  };

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    final Map<String, WidgetBuilder> allRoutes = {
      ...AppRoutes.routes,
    };

    final builder = allRoutes[settings.name]!;

    return MaterialPageRoute(builder: builder, settings: settings);
  }
}
