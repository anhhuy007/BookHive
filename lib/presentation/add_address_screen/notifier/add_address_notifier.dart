import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:loginform/presentation/add_address_screen/models/add_address_model.dart';
part 'add_address_state.dart';

final addAddressNotifier =
    StateNotifierProvider<AddAddressNotifier, AddAddressState>((ref) =>
        AddAddressNotifier(AddAddressState(
            countryEditTextController: TextEditingController(),
            firstNameEditTextController: TextEditingController(),
            lastNameEditTextController: TextEditingController(),
            streetAddressEditTextController: TextEditingController(),
            streetAddressTwoEditTextController: TextEditingController(),
            cityEditTextController: TextEditingController(),
            oldPasswordEditTextController: TextEditingController(),
            zipCodeEditTextController: TextEditingController(),
            phoneNumberEditTextController: TextEditingController(),
            addAddressModelObj: AddAddressModel())));

/// A notifier that manages the state of a AddAddress according to the event that is dispatched to it.
class AddAddressNotifier extends StateNotifier<AddAddressState> {
  AddAddressNotifier(AddAddressState state) : super(state);
}
