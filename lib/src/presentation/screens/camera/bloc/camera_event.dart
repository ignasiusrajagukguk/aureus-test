part of 'camera_bloc.dart';

abstract class CameraEvent extends Equatable {
  const CameraEvent();

  @override
  List<Object> get props => [];
}



class CameraUpdateIsStopped extends CameraEvent {
  final bool isStopped;

  const CameraUpdateIsStopped({this.isStopped = false});
}


class CameraUpdateImageFile extends CameraEvent {
  final XFile file;
  const CameraUpdateImageFile({required this.file});
}
