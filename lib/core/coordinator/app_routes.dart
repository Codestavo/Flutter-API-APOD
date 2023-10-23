import 'package:flutter/material.dart';
import 'package:nasa_space_view/features/space_view/presenter/coordinator/home_routes.dart';

class AppRoutes {
  const AppRoutes(this.route);

  final String route;

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    final Map<String, WidgetBuilder> allRoutes = {
      ...HomeRoutes.routes,
    };

    final builder = allRoutes[settings.name]!;

    return MaterialPageRoute(builder: builder, settings: settings);
  }
}
