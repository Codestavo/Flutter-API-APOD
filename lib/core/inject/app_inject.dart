import 'package:flutter/material.dart';
import 'package:nasa_space_view/core/inject/inject.dart';
import 'package:nasa_space_view/features/space_view/core/inject/space_view_inject.dart';

class AppInject extends Inject {
  final List<Inject> _modules = [
    SpaceViewInject(),
  ];

  AppInject._() {
    configure();
    datasources();
    repositories();
    usecases();
    cubits();
    configurations();
  }

  AppInject.iniciar() : this._();

  void configure() {
    getIt.registerSingleton<GlobalKey<NavigatorState>>(
      GlobalKey<NavigatorState>(),
    );
  }

  @override
  void configurations() {
    for (final module in _modules) {
      module.configurations();
    }
  }

  @override
  void cubits() {
    for (final module in _modules) {
      module.cubits();
    }
  }

  @override
  void datasources() {
    for (final module in _modules) {
      module.datasources();
    }
  }

  @override
  void repositories() {
    for (final module in _modules) {
      module.repositories();
    }
  }

  @override
  void usecases() {
    for (final module in _modules) {
      module.usecases();
    }
  }
}
