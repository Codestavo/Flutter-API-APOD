import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:nasa_space_view/features/space_view/core/errors/failure.dart';
import 'package:nasa_space_view/features/space_view/domain/entities/space_media_entity.dart';
import 'package:nasa_space_view/features/space_view/domain/usecases/get_space_media_from_date_usecase.dart';
import 'package:nasa_space_view/features/space_view/presenter/cubits/space_media_view_cubit.dart';
import 'package:nasa_space_view/features/space_view/presenter/cubits/space_media_view_state.dart';

class MockGetSpaceMediaFromDateUsecase extends Mock
    implements GetSpaceMediaFromDateUsecase {}

void main() {
  late GetSpaceMediaFromDateUsecase mockUsecase;
  late SpaceMediaViewCubit cubit;

  setUp(() {
    mockUsecase = MockGetSpaceMediaFromDateUsecase();
    cubit = SpaceMediaViewCubit(getSpaceMediaFromDateUsecase: mockUsecase);
  });

  const tSpaceMedia = SpaceMediaEntity(
    date: 'Mocked date',
    description: 'Mocked description',
    mediaUrl: 'Mocked url',
    mediaType: 'Mocked mediaType',
    title: 'Mocked title',
  );

  final tFailure = ServerFailure();

  const tErrorMessage = 'Error';

  final tDate = DateTime(2023, 10, 11);

  blocTest<SpaceMediaViewCubit, SpaceMediaViewState>(
    'Should emit [Loading, Success] when spaceMedia is successfully obtained',
    build: () => cubit,
    act: (cubit) {
      when(() => mockUsecase(any())).thenAnswer(
        (_) async => const Right(tSpaceMedia),
      );
      cubit.getSpaceMediaFromDate(date: tDate);
    },
    expect: () => [
      LoadingSpaceMediaViewState(),
      SuccessSpaceMediaViewState(
        title: tSpaceMedia.title,
        description: tSpaceMedia.description,
        spaceMediaImage: tSpaceMedia.mediaUrl,
        spaceMediaDate: tSpaceMedia.date,
      )
    ],
  );

  blocTest<SpaceMediaViewCubit, SpaceMediaViewState>(
    'Should emit [Loading, Error] when an error occurs when obtaining spaceMedia',
    build: () => cubit,
    act: (cubit) {
      when(() => mockUsecase(any())).thenAnswer(
        (_) async => Left(tFailure),
      );
      cubit.getSpaceMediaFromDate(date: tDate);
    },
    expect: () => [
      LoadingSpaceMediaViewState(),
      ErrorSpaceMediaViewState(tErrorMessage),
    ],
  );
}
