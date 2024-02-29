import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:loginform/presentation/notification_offer_screen/models/notification_offer_model.dart';
part 'notification_offer_state.dart';

final notificationOfferNotifier =
    StateNotifierProvider<NotificationOfferNotifier, NotificationOfferState>(
        (ref) => NotificationOfferNotifier(NotificationOfferState(
            notificationOfferModelObj: NotificationOfferModel())));

/// A notifier that manages the state of a NotificationOffer according to the event that is dispatched to it.
class NotificationOfferNotifier extends StateNotifier<NotificationOfferState> {
  NotificationOfferNotifier(NotificationOfferState state) : super(state);
}
