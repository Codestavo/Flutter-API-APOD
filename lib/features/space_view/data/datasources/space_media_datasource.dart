import 'package:nasa_space_view/features/space_view/data/models/space_media_model.dart';

abstract class ISpaceMediaDatasource {
  Future<SpaceMediaModel> getSpaceMediaFromDate(DateTime date);
}
