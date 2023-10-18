import 'package:nasa_space_view/features/space_view/core/http_client/http_cient.dart';
import 'package:http/http.dart' as http;

class HttpImplementation implements HttpClient {
  final client = http.Client();
  @override
  Future<HttpResponse> get(String url) async {
    final response = await client.get(Uri.parse(url));
    return HttpResponse(data: response.body, statusCode: response.statusCode);
  }
}
