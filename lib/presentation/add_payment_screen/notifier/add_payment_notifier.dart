import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:loginform/presentation/add_payment_screen/models/add_payment_model.dart';
part 'add_payment_state.dart';

final addPaymentNotifier =
    StateNotifierProvider<AddPaymentNotifier, AddPaymentState>((ref) =>
        AddPaymentNotifier(
            AddPaymentState(addPaymentModelObj: AddPaymentModel())));

/// A notifier that manages the state of a AddPayment according to the event that is dispatched to it.
class AddPaymentNotifier extends StateNotifier<AddPaymentState> {
  AddPaymentNotifier(AddPaymentState state) : super(state);
}
