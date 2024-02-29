import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import '../models/widget_item_model.dart';
import '../models/sizes_item_model.dart';
import '../models/bluelist_item_model.dart';
import '../models/products1_item_model.dart';
import '../models/recommended_item_model.dart';
import 'package:loginform/presentation/product_detail_screen/models/product_detail_model.dart';
part 'product_detail_state.dart';

final productDetailNotifier = StateNotifierProvider<
        ProductDetailNotifier, ProductDetailState>(
    (ref) => ProductDetailNotifier(ProductDetailState(
        sliderIndex: 0,
        productDetailModelObj: ProductDetailModel(
            widgetItemList: List.generate(1, (index) => WidgetItemModel()),
            sizesItemList: [
              SizesItemModel(six: "6"),
              SizesItemModel(six: "6.5"),
              SizesItemModel(six: "7"),
              SizesItemModel(six: "7.5"),
              SizesItemModel(six: "8"),
              SizesItemModel(six: "8.5")
            ],
            bluelistItemList: List.generate(6, (index) => BluelistItemModel()),
            products1ItemList: [
              Products1ItemModel(
                  productPicture: ImageConstant.imgProductPicture02),
              Products1ItemModel(
                  productPicture: ImageConstant.imgProductPicture03),
              Products1ItemModel(
                  productPicture: ImageConstant.imgProductPicture01)
            ],
            recommendedItemList: [
              RecommendedItemModel(
                  image: ImageConstant.imgProductImage,
                  fSNikeAirMax: "FS - Nike Air Max 270 React...",
                  price: "299,43",
                  price1: "534,33",
                  offer: "24% Off"),
              RecommendedItemModel(
                  image: ImageConstant.imgProductImage109x109,
                  fSNikeAirMax: "FS - QUILTED MAXI CROS...",
                  price: "299,43",
                  price1: "534,33",
                  offer: "24% Off"),
              RecommendedItemModel(
                  image: ImageConstant.imgProductImage1,
                  fSNikeAirMax: "FS - Nike Air Max 270 React...",
                  price: "299,43",
                  price1: "534,33",
                  offer: "24% Off")
            ]))));

/// A notifier that manages the state of a ProductDetail according to the event that is dispatched to it.
class ProductDetailNotifier extends StateNotifier<ProductDetailState> {
  ProductDetailNotifier(ProductDetailState state) : super(state);
}
