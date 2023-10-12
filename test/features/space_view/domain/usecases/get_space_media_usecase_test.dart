import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nasa_space_view/features/space_view/core/errors/failure.dart';
import 'package:nasa_space_view/features/space_view/domain/entities/space_media_entity.dart';
import 'package:nasa_space_view/features/space_view/domain/repositories/space_media_repository.dart';
import 'package:nasa_space_view/features/space_view/domain/usecases/get_space_media_from_date_usecase.dart';

class MockSpaceMediaRepository extends Mock implements ISpaceMediaRepository {}

void main() {
  late GetSpaceMediaFromDateUsecase usecase;
  late ISpaceMediaRepository repository;

  setUp(() {
    repository = MockSpaceMediaRepository();
    usecase = GetSpaceMediaFromDateUsecase(repository);
  });

  const tSpaceMedia = SpaceMediaEntity(
    date: 'Mocked date',
    description: 'Mocked description',
    mediaUrl: 'Mocked url',
    mediaType: 'Mocked mediaType',
    title: 'Mocked title',
  );

  const tFailure = ServerFailure(
    statusCode: 400,
    data: [],
  );

  final tDate = DateTime(2023, 10, 11);

  test(
    'Should return a space media entity from a given date when the repository\'s call succeeds',
    () async {
      when(() => repository.getSpaceMediaFromDate(tDate))
          .thenAnswer((_) async => const Right(tSpaceMedia));

      final result = await usecase(tDate);

      expect(result, equals(const Right(tSpaceMedia)));
      verify(
        () => repository.getSpaceMediaFromDate(tDate),
      );
      verifyNoMoreInteractions(repository);
    },
  );

  test(
    'Should return a ServerFailure when an error occurs with the repository\'s call',
    () async {
      when(() => repository.getSpaceMediaFromDate(tDate))
          .thenAnswer((_) async => const Left(tFailure));

      final result = await usecase(tDate);

      expect(result, equals(const Left(tFailure)));
      verify(
        () => repository.getSpaceMediaFromDate(tDate),
      );
      verifyNoMoreInteractions(repository);
    },
  );
}
