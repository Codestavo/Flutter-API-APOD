import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nasa_space_view/core/inject/inject.dart';
import 'package:nasa_space_view/features/space_view/presenter/cubits/space_media_view_cubit.dart';
import 'package:nasa_space_view/features/space_view/presenter/pages/apod/space_media_view_page.dart';
import 'package:nasa_space_view/features/space_view/presenter/pages/home/home_page.dart';

enum AppRoutes {
  home('/'),
  spaceMediaView('/space_media_view_page');

  const AppRoutes(this.route);

  final String route;
  static final Map<String, WidgetBuilder> routes = {
    home.route: (context) => const HomePage(),
    spaceMediaView.route: (context) => BlocProvider(
          create: (_) => Inject.get<SpaceMediaViewCubit>(),
          child: const SpaceMediaViewPage(),
        ),
  };

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    final Map<String, WidgetBuilder> allRoutes = {
      ...routes,
      ...AppRoutes.routes,
    };

    final builder = allRoutes[settings.name]!;

    return MaterialPageRoute(builder: builder, settings: settings);
  }
}
