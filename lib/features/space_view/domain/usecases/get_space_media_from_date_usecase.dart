import 'package:dartz/dartz.dart';
import 'package:nasa_space_view/features/space_view/core/errors/failure.dart';
import 'package:nasa_space_view/features/space_view/core/usecases/usecase.dart';
import 'package:nasa_space_view/features/space_view/domain/entities/space_media_entity.dart';
import 'package:nasa_space_view/features/space_view/domain/repositories/space_media_repository.dart';

class GetSpaceMediaFromDateUsecase
    implements Usecase<SpaceMediaEntity, DateTime> {
  final ISpaceMediaRepository repository;

  GetSpaceMediaFromDateUsecase(this.repository);

  @override
  Future<Either<Failure, SpaceMediaEntity>> call(DateTime date) async {
    return await repository.getSpaceMediaFromDate(date);
  }
}
