import 'package:bloc/bloc.dart';
import 'package:nasa_space_view/features/space_view/domain/usecases/get_space_media_from_date_usecase.dart';
import 'package:nasa_space_view/features/space_view/presenter/cubits/space_media_view_state.dart';

class SpaceMediaViewCubit extends Cubit<SpaceMediaViewState> {
  final GetSpaceMediaFromDateUsecase _getSpaceMediaFromDateUsecase;
  SpaceMediaViewCubit({
    required GetSpaceMediaFromDateUsecase getSpaceMediaFromDateUsecase,
  })  : _getSpaceMediaFromDateUsecase = getSpaceMediaFromDateUsecase,
        super(InitialSpaceMediaViewState());

  Future<void> getSpaceMediaFromDate({
    required DateTime date,
  }) async {
    emit(LoadingSpaceMediaViewState());

    final result = await _getSpaceMediaFromDateUsecase(date);

    result.fold(
      (error) => emit(
        ErrorSpaceMediaViewState(
          'Error',
        ),
      ),
      (spaceMedia) {
        spaceMedia;
        emit(
          SuccessSpaceMediaViewState(
            title: spaceMedia.title,
            description: spaceMedia.description,
            spaceMediaImage: spaceMedia.mediaUrl,
            spaceMediaDate: spaceMedia.date,
          ),
        );
      },
    );
  }
}
