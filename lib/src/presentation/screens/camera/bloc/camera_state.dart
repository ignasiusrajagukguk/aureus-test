part of 'camera_bloc.dart';

class CameraState extends Equatable {
  const CameraState(
      {this.isStopped = false,
      required this.cameraFile});

  final bool isStopped;
  final XFile cameraFile;

  CameraState copyWith({
    bool? isStopped,
    XFile? cameraFile,
    RequestState? requestState,
    UserModel? userModel
  }) {
    return CameraState(
      isStopped: isStopped ?? this.isStopped,
      cameraFile: cameraFile ?? this.cameraFile,
    );
  }

  factory CameraState.initial() => CameraState(
      cameraFile: XFile(''),);

  @override
  List<Object> get props => [isStopped, cameraFile];
}
