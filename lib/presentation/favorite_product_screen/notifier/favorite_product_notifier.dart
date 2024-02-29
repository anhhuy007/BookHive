import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import '../models/favoriteproduct_item_model.dart';
import 'package:loginform/presentation/favorite_product_screen/models/favorite_product_model.dart';
part 'favorite_product_state.dart';

final favoriteProductNotifier = StateNotifierProvider<FavoriteProductNotifier,
    FavoriteProductState>((ref) => FavoriteProductNotifier(FavoriteProductState(
        favoriteProductModelObj: FavoriteProductModel(favoriteproductItemList: [
      FavoriteproductItemModel(
          image: ImageConstant.imgProductImage2,
          nikeAirMaxReact: "Nike Air Max 270 React ENG",
          price: "299,43",
          price1: "534,33",
          offer: "24% Off"),
      FavoriteproductItemModel(
          image: ImageConstant.imgProductImage3,
          nikeAirMaxReact: "Nike Air Max 270 React ENG",
          price: "299,43",
          price1: "534,33",
          offer: "24% Off"),
      FavoriteproductItemModel(
          image: ImageConstant.imgProductImage,
          nikeAirMaxReact: "Nike Air Max 270 React ENG",
          price: "299,43",
          price1: "534,33",
          offer: "24% Off"),
      FavoriteproductItemModel(
          image: ImageConstant.imgProductImage109x109,
          nikeAirMaxReact: "Nike Air Max 270 React ENG",
          price: "299,43",
          price1: "534,33",
          offer: "24% Off")
    ]))));

/// A notifier that manages the state of a FavoriteProduct according to the event that is dispatched to it.
class FavoriteProductNotifier extends StateNotifier<FavoriteProductState> {
  FavoriteProductNotifier(FavoriteProductState state) : super(state);
}
