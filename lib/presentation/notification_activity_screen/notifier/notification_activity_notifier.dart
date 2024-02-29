import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:loginform/presentation/notification_activity_screen/models/notification_activity_model.dart';
part 'notification_activity_state.dart';

final notificationActivityNotifier = StateNotifierProvider<
        NotificationActivityNotifier, NotificationActivityState>(
    (ref) => NotificationActivityNotifier(NotificationActivityState(
        notificationActivityModelObj: NotificationActivityModel())));

/// A notifier that manages the state of a NotificationActivity according to the event that is dispatched to it.
class NotificationActivityNotifier
    extends StateNotifier<NotificationActivityState> {
  NotificationActivityNotifier(NotificationActivityState state) : super(state);
}
