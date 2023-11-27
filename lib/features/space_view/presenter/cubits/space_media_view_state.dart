import 'package:equatable/equatable.dart';

class SpaceMediaViewState extends Equatable {
  @override
  List<Object?> get props => [];
}

class InitialSpaceMediaViewState extends SpaceMediaViewState {}

class LoadingSpaceMediaViewState extends SpaceMediaViewState {}

class SuccessSpaceMediaViewState extends SpaceMediaViewState {
  final String title;
  final String description;
  final String spaceMediaImage;
  final String spaceMediaDate;

  SuccessSpaceMediaViewState({
    required this.title,
    required this.description,
    required this.spaceMediaImage,
    required this.spaceMediaDate,
  });

  @override
  List<Object?> get props => [
        title,
        description,
        spaceMediaImage,
        spaceMediaDate,
      ];
}

class ErrorSpaceMediaViewState extends SpaceMediaViewState {
  final String errorMessage;

  ErrorSpaceMediaViewState(
    this.errorMessage,
  );
}
