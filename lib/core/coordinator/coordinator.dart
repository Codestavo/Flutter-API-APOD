import 'package:flutter/material.dart';
import 'package:nasa_space_view/core/inject/inject.dart';

abstract class ICoordinator {
  static GlobalKey<NavigatorState> get key =>
      Inject.get<GlobalKey<NavigatorState>>();
}
