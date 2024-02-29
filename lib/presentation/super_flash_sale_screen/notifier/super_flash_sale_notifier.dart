import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import '../models/superflashsale_item_model.dart';
import 'package:loginform/presentation/super_flash_sale_screen/models/super_flash_sale_model.dart';
part 'super_flash_sale_state.dart';

final superFlashSaleNotifier = StateNotifierProvider<SuperFlashSaleNotifier,
    SuperFlashSaleState>((ref) => SuperFlashSaleNotifier(SuperFlashSaleState(
        superFlashSaleModelObj: SuperFlashSaleModel(superflashsaleItemList: [
      SuperflashsaleItemModel(
          image: ImageConstant.imgProductImage3,
          nikeAirMaxReact: "Nike Air Max 270 React ENG",
          price: "299,43",
          price1: "534,33",
          offer: "24% Off"),
      SuperflashsaleItemModel(
          image: ImageConstant.imgProductImage2,
          nikeAirMaxReact: "Nike Air Max 270 React ENG",
          price: "299,43",
          price1: "534,33",
          offer: "24% Off"),
      SuperflashsaleItemModel(
          image: ImageConstant.imgProductImage133x133,
          nikeAirMaxReact: "Nike Air Max 270 React ENG",
          price: "299,43",
          price1: "534,33",
          offer: "24% Off"),
      SuperflashsaleItemModel(
          image: ImageConstant.imgImageProduct,
          nikeAirMaxReact: "Nike Air Max 270 React ENG",
          price: "299,43",
          price1: "534,33",
          offer: "24% Off")
    ]))));

/// A notifier that manages the state of a SuperFlashSale according to the event that is dispatched to it.
class SuperFlashSaleNotifier extends StateNotifier<SuperFlashSaleState> {
  SuperFlashSaleNotifier(SuperFlashSaleState state) : super(state);
}
