import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  const Failure();

  @override
  List<Object?> get props => [];
}

class ServerFailure extends Failure {
  final int statusCode;
  final dynamic data;

  const ServerFailure({
    required this.statusCode,
    required this.data,
  });

  @override
  List<Object?> get props => [
        statusCode,
        data,
      ];
}
