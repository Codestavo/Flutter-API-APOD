import 'package:dio/dio.dart';

abstract class IRequestProvider {
  Future<dynamic> getAsync(
    String url, {
    ResponseType? responseType = ResponseType.json,
  });
}

class HttpResponse {
  final dynamic data;
  final int? statusCode;

  HttpResponse({
    required this.data,
    required this.statusCode,
  });
}
