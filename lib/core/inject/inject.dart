import 'package:get_it/get_it.dart';

abstract class Inject {
  static GetIt get get => GetIt.instance;

  final GetIt _getIt = get;

  GetIt get getIt => _getIt;

  void datasources();
  void repositories();
  void usecases();
  void cubits();
  void configurations();
}
