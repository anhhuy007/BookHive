import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import '../models/orders_item_model.dart';
import 'package:loginform/presentation/order_screen/models/order_model.dart';
part 'order_state.dart';

final orderNotifier = StateNotifierProvider<OrderNotifier, OrderState>(
    (ref) => OrderNotifier(OrderState(
            orderModelObj: OrderModel(ordersItemList: [
          OrdersItemModel(
              price: "SDG1345KJD",
              month: "Order at E-com : August 1, 2017",
              orderStatus: "Order Status",
              shipping: "Shipping",
              items: "Items",
              purchasedCount: "1 Items purchased",
              price1: "Price",
              price2: "299,43"),
          OrdersItemModel(
              price: "SDG1345KJD",
              month: "Order at E-com : August 1, 2017",
              orderStatus: "Order Status",
              shipping: "Shipping",
              items: "Items",
              purchasedCount: "1 Items purchased",
              price1: "Price",
              price2: "299,43"),
          OrdersItemModel(
              price: "SDG1345KJD",
              month: "Order at E-com : August 1, 2017",
              orderStatus: "Order Status",
              shipping: "Shipping",
              items: "Items",
              purchasedCount: "1 Items purchased",
              price1: "Price",
              price2: "299,43")
        ]))));

/// A notifier that manages the state of a Order according to the event that is dispatched to it.
class OrderNotifier extends StateNotifier<OrderState> {
  OrderNotifier(OrderState state) : super(state);
}
