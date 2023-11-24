import 'package:nasa_space_view/core/inject/inject.dart';
import 'package:nasa_space_view/features/space_view/core/dio/request_api_provider.dart';
import 'package:nasa_space_view/features/space_view/core/dio/request_provider.dart';
import 'package:nasa_space_view/features/space_view/data/datasources/space_media_datasource.dart';
import 'package:nasa_space_view/features/space_view/data/datasources/space_media_datasource_implementation.dart';
import 'package:nasa_space_view/features/space_view/data/repositories/space_media_repository_implementation.dart';
import 'package:nasa_space_view/features/space_view/domain/repositories/space_media_repository.dart';
import 'package:nasa_space_view/features/space_view/domain/usecases/get_space_media_from_date_usecase.dart';
import 'package:nasa_space_view/features/space_view/presenter/cubits/space_media_view_cubit.dart';

class SpaceViewInject extends Inject {
  @override
  void configurations() {
    getIt.registerSingleton<IRequestProvider>(
      RequestApiProvider(),
    );
  }

  @override
  void cubits() {
    getIt.registerFactory(
      () => SpaceMediaViewCubit(
        getSpaceMediaFromDateUsecase: getIt(),
      ),
    );
  }

  @override
  void datasources() {
    getIt.registerFactory<ISpaceMediaDatasource>(
      () => SpaceMediaDatasourceImplementation(
        getIt(),
      ),
    );
  }

  @override
  void repositories() {
    getIt.registerFactory<ISpaceMediaRepository>(
      () => SpaceMediaRepositoryImplementation(
        getIt(),
      ),
    );
  }

  @override
  void usecases() {
    getIt.registerFactory(
      () => GetSpaceMediaFromDateUsecase(
        getIt(),
      ),
    );
  }
}
