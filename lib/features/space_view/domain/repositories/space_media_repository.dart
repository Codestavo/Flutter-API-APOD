import 'package:dartz/dartz.dart';
import 'package:nasa_space_view/features/space_view/core/errors/failure.dart';
import 'package:nasa_space_view/features/space_view/domain/entities/space_media_entity.dart';

abstract class ISpaceMediaRepository {
  Future<Either<Failure, SpaceMediaEntity>> getSpaceMediaFromDate(
    DateTime date,
  );
}
