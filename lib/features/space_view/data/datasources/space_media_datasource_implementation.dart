import 'dart:convert';

import 'package:nasa_space_view/features/space_view/core/errors/exceptions.dart';
import 'package:nasa_space_view/features/space_view/core/errors/failure.dart';
import 'package:nasa_space_view/features/space_view/core/dio/request_provider.dart';
import 'package:nasa_space_view/features/space_view/core/utils/converter/date_to_string_converter.dart';
import 'package:nasa_space_view/features/space_view/core/utils/keys/nasa_api_keys.dart';
import 'package:nasa_space_view/features/space_view/data/datasources/endpoints/nasa_endpoint.dart';
import 'package:nasa_space_view/features/space_view/data/datasources/space_media_datasource.dart';
import 'package:nasa_space_view/features/space_view/data/models/space_media_model.dart';

class SpaceMediaDatasourceImplementation implements ISpaceMediaDatasource {
  final IRequestProvider _requestApiProvider;

  SpaceMediaDatasourceImplementation(this._requestApiProvider);

  @override
  Future<SpaceMediaModel> getSpaceMediaFromDate(
    DateTime date,
  ) async {
    try {
      final response = await _requestApiProvider.getAsync(
        NasaEndpoint.apod(
          NasaApiKeys.apiKey,
          DateToStringConverter.convertDateToString(
            date,
          ),
        ),
      );

      return SpaceMediaModel.fromJson(
        response,
      );
    } catch (e) {
      throw ServerFailure();
    }
  }
}
