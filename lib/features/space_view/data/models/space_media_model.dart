import 'package:nasa_space_view/features/space_view/domain/entities/space_media_entity.dart';

class SpaceMediaModel extends SpaceMediaEntity {
  SpaceMediaModel({
    required String date,
    required String description,
    required String mediaUrl,
    required String mediaType,
    required String title,
  }) : super(
          date: date,
          description: description,
          mediaUrl: mediaUrl,
          mediaType: mediaType,
          title: title,
        );

  factory SpaceMediaModel.fromJson(Map<String, dynamic> json) {
    return SpaceMediaModel(
      date: json['date'],
      description: json['explanation'],
      mediaUrl: json['url'],
      mediaType: json['media_type'],
      title: json['title'],
    );
  }
}
