import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import '../models/shiptolist_item_model.dart';
import 'package:loginform/presentation/ship_to_screen/models/ship_to_model.dart';
part 'ship_to_state.dart';

final shipToNotifier = StateNotifierProvider<ShipToNotifier, ShipToState>(
    (ref) => ShipToNotifier(ShipToState(
            shipToModelObj: ShipToModel(shiptolistItemList: [
          ShiptolistItemModel(
              priscekila: "Priscekila",
              address:
                  "3711 Spring Hill Rd undefined Tallahassee, Nevada 52874 United States",
              mobileNo: "+99 1234567890",
              edit: "Edit",
              delete: "Delete"),
          ShiptolistItemModel(
              priscekila: "Priscekila",
              address:
                  "3711 Spring Hill Rd undefined Tallahassee, Nevada 52874 United States",
              mobileNo: "+99 1234567890",
              edit: "Edit",
              delete: "Delete"),
          ShiptolistItemModel(
              priscekila: "Priscekila",
              address:
                  "3711 Spring Hill Rd undefined Tallahassee, Nevada 52874 United States",
              mobileNo: "+99 1234567890",
              edit: "Edit",
              delete: "Delete")
        ]))));

/// A notifier that manages the state of a ShipTo according to the event that is dispatched to it.
class ShipToNotifier extends StateNotifier<ShipToState> {
  ShipToNotifier(ShipToState state) : super(state);
}
