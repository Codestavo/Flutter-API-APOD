import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nasa_space_view/core/inject/inject.dart';
import 'package:nasa_space_view/features/space_view/presenter/cubits/home_cubit.dart';
import 'package:nasa_space_view/features/space_view/presenter/pages/home_page.dart';

enum HomeRoutes {
  home('/');

  const HomeRoutes(this.route);

  final String route;

  static final Map<String, WidgetBuilder> routes = {
    home.route: (context) => BlocProvider<HomeCubit>(
          create: (_) => Inject.get<HomeCubit>(),
          child: const HomePage(),
        )
  };

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    late final WidgetBuilder builder;
    final route = HomeRoutes.values.firstWhere(
      (element) => element.route == settings.name,
    );

    switch (route) {
      case home:
        builder = (_) => BlocProvider<HomeCubit>(
              create: (context) => Inject.get<HomeCubit>(),
              child: const HomePage(),
            );
        break;
    }

    return MaterialPageRoute(
      builder: builder,
    );
  }
}
