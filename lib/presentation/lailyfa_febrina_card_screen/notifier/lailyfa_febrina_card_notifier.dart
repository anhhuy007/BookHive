import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:loginform/presentation/lailyfa_febrina_card_screen/models/lailyfa_febrina_card_model.dart';
part 'lailyfa_febrina_card_state.dart';

final lailyfaFebrinaCardNotifier =
    StateNotifierProvider<LailyfaFebrinaCardNotifier, LailyfaFebrinaCardState>(
        (ref) => LailyfaFebrinaCardNotifier(LailyfaFebrinaCardState(
            cardNumberController: TextEditingController(),
            expirationDateController: TextEditingController(),
            securityCodeController: TextEditingController(),
            cardHolderNameController: TextEditingController(),
            lailyfaFebrinaCardModelObj: LailyfaFebrinaCardModel())));

/// A notifier that manages the state of a LailyfaFebrinaCard according to the event that is dispatched to it.
class LailyfaFebrinaCardNotifier
    extends StateNotifier<LailyfaFebrinaCardState> {
  LailyfaFebrinaCardNotifier(LailyfaFebrinaCardState state) : super(state);
}
