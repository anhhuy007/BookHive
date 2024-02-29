import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:loginform/presentation/notification_feed_screen/models/notification_feed_model.dart';
part 'notification_feed_state.dart';

final notificationFeedNotifier =
    StateNotifierProvider<NotificationFeedNotifier, NotificationFeedState>(
        (ref) => NotificationFeedNotifier(NotificationFeedState(
            notificationFeedModelObj: NotificationFeedModel())));

/// A notifier that manages the state of a NotificationFeed according to the event that is dispatched to it.
class NotificationFeedNotifier extends StateNotifier<NotificationFeedState> {
  NotificationFeedNotifier(NotificationFeedState state) : super(state);
}
