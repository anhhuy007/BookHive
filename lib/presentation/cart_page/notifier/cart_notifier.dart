import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import '../models/cart_item_model.dart';
import 'package:loginform/presentation/cart_page/models/cart_model.dart';
part 'cart_state.dart';

final cartNotifier = StateNotifierProvider<CartNotifier, CartState>(
    (ref) => CartNotifier(CartState(
        cuponCodeController: TextEditingController(),
        cartModelObj: CartModel(cartItemList: [
          CartItemModel(
              nikeAirZoomPegasus: "Nike Air Zoom Pegasus 36 Miami",
              price: "299,43",
              one: "1"),
          CartItemModel(
              nikeAirZoomPegasus: "Nike Air Zoom Pegasus 36 Miami",
              price: "299,43",
              one: "1")
        ]))));

/// A notifier that manages the state of a Cart according to the event that is dispatched to it.
class CartNotifier extends StateNotifier<CartState> {
  CartNotifier(CartState state) : super(state);
}
