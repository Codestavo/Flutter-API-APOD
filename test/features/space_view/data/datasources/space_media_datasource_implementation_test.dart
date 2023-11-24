import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nasa_space_view/features/space_view/core/errors/exceptions.dart';
import 'package:nasa_space_view/features/space_view/core/dio/request_provider.dart';
import 'package:nasa_space_view/features/space_view/data/datasources/space_media_datasource.dart';
import 'package:nasa_space_view/features/space_view/data/datasources/space_media_datasource_implementation.dart';
import 'package:nasa_space_view/features/space_view/data/models/space_media_model.dart';

import '../../../mocks/space_media_mock.dart';

class MockHttpClient extends Mock implements IRequestProvider {}

void main() {
  late ISpaceMediaDatasource datasource;
  late IRequestProvider client;
  setUp(() {
    client = MockHttpClient();
    datasource = SpaceMediaDatasourceImplementation(client);
  });

  final tDate = DateTime(2023, 10, 18);
  const tUrl =
      "https://api.nasa.gov/planetary/apod?api_key=DEMO_KEY&date=2023-10-18";

  void successMock() {
    when(() => client.getAsync(any())).thenAnswer(
      (_) async => HttpResponse(
        data: spaceMediaMock,
        statusCode: 200,
      ),
    );
  }

  final tSpaceMediaModel = SpaceMediaModel(
    date: '2023-10-18',
    description:
        'It\'s so big it is easy to miss. The entire Veil Nebula spans six times the diameter of the full moon, but is so dim you need binoculars to see it. The nebula was created about 15,000 years ago when a star in the constellation of the Swan (Cygnus) exploded. The spectacular explosion would have appeared brighter than even Venus for a week - but there is no known record of it.  Pictured is the western edge of the still-expanding gas cloud. Notable gas filaments include the Witch\'s Broom Nebula on the upper left near the bright foreground star 52 Cygni, and Fleming\'s Triangular Wisp (formerly known as Pickering\'s Triangle) running diagonally up the image middle.  What is rarely imaged -- but seen in the featured long exposure across many color bands -- is the reflecting brown dust that runs vertically up the image left, dust likely created in the cool atmospheres of massive stars.',
    mediaUrl: 'https://apod.nasa.gov/apod/image/2310/WesternVeil_Wu_960.jpg',
    mediaType: 'image',
    title: 'Dust and the Western Veil Nebula',
  );

  test('Should get the correct url after calling the get method', () async {
    successMock();

    await datasource.getSpaceMediaFromDate(tDate);

    verify(() => client.getAsync(tUrl));
    verifyNoMoreInteractions(client);
  });

  test('Should return a SpaceMediaModel when succeds', () async {
    successMock();

    final result = await datasource.getSpaceMediaFromDate(tDate);

    expect(result, tSpaceMediaModel);
  });

  test('Should return a ServerException when the request is unsuccessful',
      () async {
    when(() => client.getAsync(any())).thenAnswer(
        (_) async => HttpResponse(data: 'Error message', statusCode: 400));

    final result = datasource.getSpaceMediaFromDate(tDate);

    expect(() => result, throwsA(ServerException()));
  });
}
