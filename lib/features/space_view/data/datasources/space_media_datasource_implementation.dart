import 'dart:convert';

import 'package:nasa_space_view/features/space_view/core/errors/exceptions.dart';
import 'package:nasa_space_view/features/space_view/core/http_client/http_cient.dart';
import 'package:nasa_space_view/features/space_view/core/utils/converter/date_to_string_converter.dart';
import 'package:nasa_space_view/features/space_view/core/utils/keys/nasa_api_keys.dart';
import 'package:nasa_space_view/features/space_view/data/datasources/endpoints/nasa_endpoint.dart';
import 'package:nasa_space_view/features/space_view/data/datasources/space_media_datasource.dart';
import 'package:nasa_space_view/features/space_view/data/models/space_media_model.dart';

class SpaceMediaDatasourceImplementation implements ISpaceMediaDatasource {
  final HttpClient client;

  SpaceMediaDatasourceImplementation(this.client);
  @override
  Future<SpaceMediaModel> getSpaceMediaFromDate(DateTime date) async {
    final response = await client.get(NasaEndpoint.apod(
        NasaApiKeys.apiKey, DateToStringConverter.convertDateToString(date)));
    if (response.statusCode == 200) {
      return SpaceMediaModel.fromJson(jsonDecode(response.data));
    } else {
      throw ServerException();
    }
  }
}
