// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:loginform/presentation/dashboard_page/models/category_item_model.dart';
import 'book_item_model.dart';
import 'offerbanner_item_model.dart';
import '../../../core/app_export.dart';
import 'flashsale_item_model.dart';
import 'megasale_item_model.dart';
import 'products_item_model.dart';
import 'package:logging_to_logcat/logging_to_logcat.dart';
import 'package:logging/logging.dart';

/// This class defines the variables used in the [dashboard_page],
/// and is typically used to hold data that is passed between different parts of the application.
class DashboardModel extends Equatable {
  DashboardModel({
    this.offerbannerItemList = const [],
    this.categoriesItemList = const [],
    this.bestSellerItemList = const [],
    this.megasaleItemList = const [],
    this.productsItemList = const [],
  }) {}

  const DashboardModel.initial({
    this.offerbannerItemList = const [],
    this.categoriesItemList = const [],
    this.bestSellerItemList = const [],
    this.megasaleItemList = const [],
    this.productsItemList = const [],
  });

  final List<OfferbannerItemModel> offerbannerItemList;
  final List<CategoryItem> categoriesItemList;
  final List<BookItem> bestSellerItemList;
  final List<MegasaleItemModel> megasaleItemList;
  final List<ProductsItemModel> productsItemList;

  DashboardModel copyWith({
    List<OfferbannerItemModel>? offerbannerItemList,
    List<CategoryItem>? categoriesItemList,
    List<BookItem>? bestSellerItemList,
    List<MegasaleItemModel>? megasaleItemList,
    List<ProductsItemModel>? productsItemList,
  }) {
    return DashboardModel(
      offerbannerItemList: offerbannerItemList ?? this.offerbannerItemList,
      categoriesItemList: categoriesItemList ?? this.categoriesItemList,
      bestSellerItemList: bestSellerItemList ?? this.bestSellerItemList,
      megasaleItemList: megasaleItemList ?? this.megasaleItemList,
      productsItemList: productsItemList ?? this.productsItemList,
    );
  }

  @override
  List<Object?> get props => [
        offerbannerItemList,
        categoriesItemList,
        bestSellerItemList,
        megasaleItemList,
        productsItemList
      ];
}
