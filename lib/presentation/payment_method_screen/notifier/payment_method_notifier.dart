import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:loginform/presentation/payment_method_screen/models/payment_method_model.dart';
part 'payment_method_state.dart';

final paymentMethodNotifier =
    StateNotifierProvider<PaymentMethodNotifier, PaymentMethodState>((ref) =>
        PaymentMethodNotifier(
            PaymentMethodState(paymentMethodModelObj: PaymentMethodModel())));

/// A notifier that manages the state of a PaymentMethod according to the event that is dispatched to it.
class PaymentMethodNotifier extends StateNotifier<PaymentMethodState> {
  PaymentMethodNotifier(PaymentMethodState state) : super(state);
}
