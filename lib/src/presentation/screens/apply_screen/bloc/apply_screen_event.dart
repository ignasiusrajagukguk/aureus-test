part of 'apply_screen_bloc.dart';

abstract class ApplyScreenEvent extends Equatable {
  const ApplyScreenEvent();

  @override
  List<Object> get props => [];
}



class ApplyScreenSetTabIndex extends ApplyScreenEvent {
  final int tabIndex;

  const ApplyScreenSetTabIndex({this.tabIndex = 0});
}
class ApplyScreenUpdateImage extends ApplyScreenEvent {
  final String imagePath;

  const ApplyScreenUpdateImage({this.imagePath = ''});
}

