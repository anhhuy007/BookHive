import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import '../models/creditcarditems_item_model.dart';
import 'package:loginform/presentation/credit_card_and_debit_screen/models/credit_card_and_debit_model.dart';
part 'credit_card_and_debit_state.dart';

final creditCardAndDebitNotifier =
    StateNotifierProvider<CreditCardAndDebitNotifier, CreditCardAndDebitState>(
        (ref) => CreditCardAndDebitNotifier(CreditCardAndDebitState(
                creditCardAndDebitModelObj:
                    CreditCardAndDebitModel(creditcarditemsItemList: [
              CreditcarditemsItemModel(
                  debitCardNumber: "6326    9124    8124    9875",
                  cardholder: "CARD HOLDER",
                  dominicOvo: "Dominic Ovo",
                  cardsave: "CARD SAVE",
                  debitCardExpiry: "06/24"),
              CreditcarditemsItemModel(
                  debitCardNumber: "6326    9124    8124    9875",
                  cardholder: "CARD HOLDER",
                  dominicOvo: "Dominic Ovo",
                  cardsave: "CARD SAVE",
                  debitCardExpiry: "06/24")
            ]))));

/// A notifier that manages the state of a CreditCardAndDebit according to the event that is dispatched to it.
class CreditCardAndDebitNotifier
    extends StateNotifier<CreditCardAndDebitState> {
  CreditCardAndDebitNotifier(CreditCardAndDebitState state) : super(state);
}
