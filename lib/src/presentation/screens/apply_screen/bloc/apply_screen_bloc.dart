import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'apply_screen_event.dart';
part 'apply_screen_state.dart';

class ApplyScreenBloc extends Bloc<ApplyScreenEvent, ApplyScreenState> {
  ApplyScreenBloc() : super(ApplyScreenState.initial()) {
    on<ApplyScreenSetTabIndex>(_dashboardSetTabIndex);
    on<ApplyScreenUpdateImage>(_dashboardUpdateImagePath);
  }

  void _dashboardSetTabIndex(ApplyScreenSetTabIndex event, emit) async {
    emit(state.copyWith(tabIndex: event.tabIndex));
  }

  void _dashboardUpdateImagePath(ApplyScreenUpdateImage event, emit) async {
    emit(state.copyWith(imagePath: event.imagePath));
  }
}
