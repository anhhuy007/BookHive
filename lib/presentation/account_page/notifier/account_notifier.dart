import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:loginform/presentation/account_page/models/account_model.dart';
part 'account_state.dart';

final accountNotifier = StateNotifierProvider<AccountNotifier, AccountState>(
    (ref) => AccountNotifier(AccountState(accountModelObj: AccountModel())));

/// A notifier that manages the state of a Account according to the event that is dispatched to it.
class AccountNotifier extends StateNotifier<AccountState> {
  AccountNotifier(AccountState state) : super(state);
}
