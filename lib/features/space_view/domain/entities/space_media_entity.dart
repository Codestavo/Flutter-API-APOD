import 'package:equatable/equatable.dart';

class SpaceMediaEntity extends Equatable {
  final String date;
  final String description;
  final String mediaUrl;
  final String mediaType;
  final String title;

  const SpaceMediaEntity({
    required this.date,
    required this.description,
    required this.mediaUrl,
    required this.mediaType,
    required this.title,
  });

  @override
  List<Object?> get props => [
        date,
        description,
        mediaUrl,
        mediaType,
        title,
      ];
}
