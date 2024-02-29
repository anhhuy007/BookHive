import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import '../models/addresses_item_model.dart';
import 'package:loginform/presentation/address_screen/models/address_model.dart';
part 'address_state.dart';

final addressNotifier = StateNotifierProvider<AddressNotifier, AddressState>(
    (ref) => AddressNotifier(AddressState(
            addressModelObj: AddressModel(addressesItemList: [
          AddressesItemModel(
              priscekila: "Priscekila",
              address:
                  "3711 Spring Hill Rd undefined Tallahassee, Nevada 52874 United States",
              mobileNo: "+99 1234567890",
              edit: "Edit",
              delete: "Delete"),
          AddressesItemModel(
              priscekila: "Ahmad Khaidir",
              address:
                  "3711 Spring Hill Rd undefined Tallahassee, Nevada 52874 United States",
              mobileNo: "+99 1234567890",
              edit: "Edit",
              delete: "Delete")
        ]))));

/// A notifier that manages the state of a Address according to the event that is dispatched to it.
class AddressNotifier extends StateNotifier<AddressState> {
  AddressNotifier(AddressState state) : super(state);
}
