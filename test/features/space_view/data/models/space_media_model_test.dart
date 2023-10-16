import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:nasa_space_view/features/space_view/data/models/space_media_model.dart';
import 'package:nasa_space_view/features/space_view/domain/entities/space_media_entity.dart';

import '../../../mocks/space_media_mock.dart';

void main() {
  final tSpaceMediaModel = SpaceMediaModel(
    date: 'Mocked date',
    description: 'Mocked description',
    mediaUrl: 'Mocked url',
    mediaType: 'Mocked mediaType',
    title: 'Mocked title',
  );

  test('Should be a subclass of SpaceMediaEntity', () {
    expect(tSpaceMediaModel, isA<SpaceMediaEntity>());
  });

  test('Should return a valid model', () {
    final Map<String, dynamic> jsonMap = json.decode(spaceMediaMock);
    final result = SpaceMediaModel.fromJson(jsonMap);
    expect(result, tSpaceMediaModel);
  });
}
