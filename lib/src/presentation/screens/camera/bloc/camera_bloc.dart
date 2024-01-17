import 'package:aureus_group/src/common/enum/request_state.dart';
import 'package:aureus_group/src/data/models/user.dart';
import 'package:bloc/bloc.dart';
import 'package:camera/camera.dart';
import 'package:equatable/equatable.dart';

part 'camera_event.dart';
part 'camera_state.dart';

class CameraBloc extends Bloc<CameraEvent, CameraState> {
  CameraBloc() : super(CameraState.initial()) {
    on<CameraUpdateIsStopped>(_cameraSetIsStopped);
    on<CameraUpdateImageFile>(_updateCameraFile);
  }

  void _cameraSetIsStopped(CameraUpdateIsStopped event, emit) async {
    emit(state.copyWith(isStopped: event.isStopped));
  }

  _updateCameraFile(CameraUpdateImageFile event, emit) async {
    emit(state.copyWith(cameraFile: event.file));
  }

}
