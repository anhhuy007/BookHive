// ignore_for_file: must_be_immutable
part of 'dashboard_notifier.dart';
/// Represents the state of Dashboard in the application.

enum DashboardConcreteState {
  INITIAL,
  LOADING,
  FAILURE,
  LOADED
}

class DashboardState extends Equatable {
  DashboardState({
    this.sliderIndex = 0,
    this.dashboardModelObj = const DashboardModel.initial(),
    this.dashboardConcreteState = DashboardConcreteState.INITIAL
  });

  DashboardModel dashboardModelObj;
  int sliderIndex;
  DashboardConcreteState dashboardConcreteState;

  @override
  List<Object?> get props => [
        sliderIndex,
        dashboardModelObj,
        dashboardConcreteState,
      ];

  DashboardState copyWith({
    int? sliderIndex,
    DashboardModel? dashboardModelObj,
    DashboardConcreteState? dashboardConcreteState
  }) {
    return DashboardState(
      sliderIndex: sliderIndex ?? this.sliderIndex,
      dashboardModelObj: dashboardModelObj ?? this.dashboardModelObj,
      dashboardConcreteState: dashboardConcreteState ?? this.dashboardConcreteState
    );
  }
}
