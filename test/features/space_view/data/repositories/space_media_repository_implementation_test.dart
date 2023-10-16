import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nasa_space_view/features/space_view/core/errors/exceptions.dart';
import 'package:nasa_space_view/features/space_view/core/errors/failure.dart';
import 'package:nasa_space_view/features/space_view/data/datasources/space_media_datasource.dart';
import 'package:nasa_space_view/features/space_view/data/models/space_media_model.dart';
import 'package:nasa_space_view/features/space_view/data/repositories/space_media_repository_implementation.dart';

class MockSpaceMediaDatasource extends Mock implements ISpaceMediaDatasource {}

void main() {
  late SpaceMediaRepositoryImplementation repository;
  late ISpaceMediaDatasource datasource;

  setUp(() {
    datasource = MockSpaceMediaDatasource();
    repository = SpaceMediaRepositoryImplementation(datasource);
  });

  final tSpaceMediaModel = SpaceMediaModel(
    date: 'Mocked date',
    description: 'Mocked description',
    mediaUrl: 'Mocked url',
    mediaType: 'Mocked mediaType',
    title: 'Mocked title',
  );

  final tDate = DateTime(2023, 10, 11);

  test('Should return a space media model when the datasource\'s call succeeds',
      () async {
    when(() => datasource.getSpaceMediaFromDate(tDate))
        .thenAnswer((_) async => tSpaceMediaModel);
    final result = await repository.getSpaceMediaFromDate(tDate);

    expect(result, Right(tSpaceMediaModel));
    verify(
      () => datasource.getSpaceMediaFromDate(tDate),
    );
    verifyNoMoreInteractions(datasource);
  });

  test(
      'Should return a ServerFailure when an error occurs with the datasource\'s call',
      () async {
    when(() => datasource.getSpaceMediaFromDate(tDate))
        .thenThrow(ServerException());
    final result = await repository.getSpaceMediaFromDate(tDate);

    expect(result, Left(ServerFailure()));
    verify(
      () => datasource.getSpaceMediaFromDate(tDate),
    );
    verifyNoMoreInteractions(datasource);
  });
}
