import 'package:aureus_group/src/common/enum/request_state.dart';
import 'package:aureus_group/src/common/util/logger.dart';
import 'package:aureus_group/src/data/models/job_list_model.dart';
import 'package:aureus_group/src/data/models/user.dart';
import 'package:aureus_group/src/repositories/job_list.dart';
import 'package:aureus_group/src/repositories/profile_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc() : super(DashboardState.initial()) {
    on<DashboardSetTabIndex>(_dashboardSetTabIndex);
    on<GetJobList>(_getJobList);
    on<GetProfileData>(_getProfileData);
  }

  void _dashboardSetTabIndex(DashboardSetTabIndex event, emit) async {
    emit(state.copyWith(tabIndex: event.tabIndex));
  }

  _getJobList(GetJobList event, emit) async {
    try {
      emit(state.copyWith(requestState: RequestState.loading));
      JobListModel data = await JobRepository().getJobList();
      emit(state.copyWith(
          jobListModel: data, requestState: RequestState.success));
    } catch (e) {
      emit(state.copyWith(requestState: RequestState.error));
    }
  }

  _getProfileData(GetProfileData event, emit) async {
    try {
      emit(state.copyWith(requestState: RequestState.loading));
      UserModel user =
          await ProfileRepository().getProfileData('ignasius@gmail.com');
      Log.info('AFTER GET PROFILE ${user.email}');
      emit(state.copyWith(userModel: user, requestState: RequestState.success));
    } catch (e) {
      emit(state.copyWith(requestState: RequestState.error));
    }
  }
}
