part of 'dashboard_bloc.dart';

class DashboardState extends Equatable {
  const DashboardState(
      {this.tabIndex = 0,
      required this.jobListModel,
      required this.requestState});

  final int tabIndex;
  final JobListModel jobListModel;
  final RequestState requestState;

  DashboardState copyWith({
    int? tabIndex,
    JobListModel? jobListModel,
    RequestState? requestState,
  }) {
    return DashboardState(
      tabIndex: tabIndex ?? this.tabIndex,
      jobListModel: jobListModel ?? this.jobListModel,
      requestState: requestState ?? this.requestState,
    );
  }

  factory DashboardState.initial() => DashboardState(
      jobListModel: JobListModel(), requestState: RequestState.empty);

  @override
  List<Object> get props => [tabIndex, jobListModel, requestState];
}
