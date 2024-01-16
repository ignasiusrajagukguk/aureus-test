part of 'apply_screen_bloc.dart';

class ApplyScreenState extends Equatable {
  const ApplyScreenState({
    this.tabIndex = 0,
    required this.imagePath,
  });

  final int tabIndex;
  final String imagePath;

  ApplyScreenState copyWith({
    int? tabIndex,
    String? imagePath,
  }) {
    return ApplyScreenState(
      tabIndex: tabIndex ?? this.tabIndex,
      imagePath: imagePath ?? this.imagePath,
    );
  }

  factory ApplyScreenState.initial() => const ApplyScreenState(
        imagePath: '',
      );

  @override
  List<Object> get props => [tabIndex, imagePath];
}
