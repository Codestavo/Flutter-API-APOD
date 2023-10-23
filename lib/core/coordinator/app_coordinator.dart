import 'package:flutter/material.dart';
import 'package:nasa_space_view/core/coordinator/coordinator.dart';
import 'package:nasa_space_view/features/space_view/presenter/coordinator/home_routes.dart';

class AppCoordinator {
  static Future<void> redirectAppToLoading() async {
    ICoordinator.key.currentState!.push(
      DialogRoute<void>(
        context: ICoordinator.key.currentContext!,
        useSafeArea: false,
        barrierColor: Colors.transparent,
        builder: (_) => const CircularProgressIndicator(),
      ),
    );
  }

  static void redirectAppToBeginning() {
    ICoordinator.key.currentState!.pushNamedAndRemoveUntil(
      HomeRoutes.home.route,
      (route) => false,
    );
  }

  static void redirectAppToPrevious() {
    ICoordinator.key.currentState!.pop();
  }
}
