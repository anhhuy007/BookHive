import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:loginform/presentation/notification_screen/models/notification_model.dart';
part 'notification_state.dart';

final notificationNotifier =
    StateNotifierProvider<NotificationNotifier, NotificationState>((ref) =>
        NotificationNotifier(
            NotificationState(notificationModelObj: NotificationModel())));

/// A notifier that manages the state of a Notification according to the event that is dispatched to it.
class NotificationNotifier extends StateNotifier<NotificationState> {
  NotificationNotifier(NotificationState state) : super(state);
}
