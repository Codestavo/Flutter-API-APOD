import 'package:flutter/material.dart';
import 'package:nasa_space_view/core/coordinator/app_routes.dart';
import 'package:nasa_space_view/core/coordinator/coordinator.dart';

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
      AppRoutes.home.route,
      (route) => false,
    );
  }

  static void redirectAppToPrevious() {
    ICoordinator.key.currentState!.pop();
  }

  static Future<void> redirectToApodPage() async {
    await ICoordinator.key.currentState!.pushNamed(
      AppRoutes.spaceMediaView.route,
    );
  }
}
