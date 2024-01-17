part of 'dashboard_bloc.dart';

class DashboardState extends Equatable {
  const DashboardState(
      {this.tabIndex = 0,
      required this.jobListModel,
      required this.requestState,
      required this.userModel});

  final int tabIndex;
  final JobListModel jobListModel;
  final RequestState requestState;
  final UserModel userModel;

  DashboardState copyWith({
    int? tabIndex,
    JobListModel? jobListModel,
    RequestState? requestState,
    UserModel? userModel
  }) {
    return DashboardState(
      tabIndex: tabIndex ?? this.tabIndex,
      jobListModel: jobListModel ?? this.jobListModel,
      requestState: requestState ?? this.requestState,
      userModel: userModel??this.userModel
    );
  }

  factory DashboardState.initial() => DashboardState(
      jobListModel: JobListModel(), requestState: RequestState.empty, userModel: UserModel());

  @override
  List<Object> get props => [tabIndex, jobListModel, requestState, userModel];
}
