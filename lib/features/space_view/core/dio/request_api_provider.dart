import 'package:dio/dio.dart';
import 'package:nasa_space_view/features/space_view/core/errors/failure.dart';
import 'package:nasa_space_view/features/space_view/core/dio/request_provider.dart';

class RequestApiProvider implements IRequestProvider {
  late Dio _dio;

  RequestApiProvider() {
    _dio = Dio();
  }

  @override
  Future<dynamic> getAsync(
    String url, {
    ResponseType? responseType = ResponseType.json,
  }) async {
    try {
      final response = await _dio.get(
        url,
        options: Options(
          responseType: responseType,
        ),
      );

      return response.data;
    } catch (e) {
      throw ServerFailure();
    }
  }
}
