import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import '../models/searchresult_item_model.dart';
import 'package:loginform/presentation/search_result_screen/models/search_result_model.dart';
part 'search_result_state.dart';

final searchResultNotifier =
    StateNotifierProvider<SearchResultNotifier, SearchResultState>(
        (ref) => SearchResultNotifier(SearchResultState(
            searchController: TextEditingController(),
            selectedDropDownValue: SelectionPopupModel(title: ''),
            searchResultModelObj: SearchResultModel(dropdownItemList: [
              SelectionPopupModel(id: 1, title: "Item One", isSelected: true),
              SelectionPopupModel(id: 2, title: "Item Two"),
              SelectionPopupModel(id: 3, title: "Item Three")
            ], searchresultItemList: [
              SearchresultItemModel(
                  image: ImageConstant.imgProductImage1,
                  nikeAirMaxReact: "Nike Air Max 270 React ENG",
                  price: "299,43",
                  price1: "534,33",
                  offer: "24% Off"),
              SearchresultItemModel(
                  image: ImageConstant.imgImageProduct,
                  nikeAirMaxReact: "Nike Air Max 270 React ENG",
                  price: "299,43",
                  price1: "534,33",
                  offer: "24% Off"),
              SearchresultItemModel(
                  image: ImageConstant.imgProductImage,
                  nikeAirMaxReact: "Nike Air Max 270 React ENG",
                  price: "299,43",
                  price1: "534,33",
                  offer: "24% Off"),
              SearchresultItemModel(
                  image: ImageConstant.imgProductImage3,
                  nikeAirMaxReact: "Nike Air Max 270 React ENG",
                  price: "299,43",
                  price1: "534,33",
                  offer: "24% Off"),
              SearchresultItemModel(
                  image: ImageConstant.imgImageProduct,
                  nikeAirMaxReact: "Nike Air Max 270 React ENG",
                  price: "299,43",
                  price1: "534,33",
                  offer: "24% Off"),
              SearchresultItemModel(
                  image: ImageConstant.imgProductImage1,
                  nikeAirMaxReact: "Nike Air Max 270 React ENG",
                  price: "299,43",
                  price1: "534,33",
                  offer: "24% Off")
            ]))));

/// A notifier that manages the state of a SearchResult according to the event that is dispatched to it.
class SearchResultNotifier extends StateNotifier<SearchResultState> {
  SearchResultNotifier(SearchResultState state) : super(state);
}
