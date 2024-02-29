// ignore_for_file: must_be_immutable

part of 'account_notifier.dart';

/// Represents the state of Account in the application.
class AccountState extends Equatable {
  AccountState({this.accountModelObj});

  AccountModel? accountModelObj;

  @override
  List<Object?> get props => [
        accountModelObj,
      ];

  AccountState copyWith({AccountModel? accountModelObj}) {
    return AccountState(
      accountModelObj: accountModelObj ?? this.accountModelObj,
    );
  }
}
