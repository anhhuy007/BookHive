import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import '../models/productlist_item_model.dart';
import 'package:loginform/presentation/order_details_screen/models/order_details_model.dart';
part 'order_details_state.dart';

final orderDetailsNotifier =
    StateNotifierProvider<OrderDetailsNotifier, OrderDetailsState>(
        (ref) => OrderDetailsNotifier(OrderDetailsState(
                orderDetailsModelObj: OrderDetailsModel(productlistItemList: [
              ProductlistItemModel(
                  image: ImageConstant.imgImageProduct,
                  nikeAirZoomPegasus: "Nike Air Zoom Pegasus 36 Miami",
                  image1: ImageConstant.imgLoveIconPink300,
                  price: "299,43",
                  one: "1"),
              ProductlistItemModel(
                  image: ImageConstant.imgProductImage1,
                  nikeAirZoomPegasus: "Nike Air Zoom Pegasus 36 Miami",
                  image1: ImageConstant.imgLoveIcon,
                  price: "299,43",
                  one: "1")
            ]))));

/// A notifier that manages the state of a OrderDetails according to the event that is dispatched to it.
class OrderDetailsNotifier extends StateNotifier<OrderDetailsState> {
  OrderDetailsNotifier(OrderDetailsState state) : super(state);
}
