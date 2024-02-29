import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:loginform/presentation/dashboard_container_screen/models/dashboard_container_model.dart';
part 'dashboard_container_state.dart';

final dashboardContainerNotifier =
    StateNotifierProvider<DashboardContainerNotifier, DashboardContainerState>(
        (ref) => DashboardContainerNotifier(DashboardContainerState(
            dashboardContainerModelObj: DashboardContainerModel())));

/// A notifier that manages the state of a DashboardContainer according to the event that is dispatched to it.
class DashboardContainerNotifier
    extends StateNotifier<DashboardContainerState> {
  DashboardContainerNotifier(DashboardContainerState state) : super(state);
}
