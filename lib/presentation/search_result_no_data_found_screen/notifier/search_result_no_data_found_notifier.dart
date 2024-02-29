import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:loginform/presentation/search_result_no_data_found_screen/models/search_result_no_data_found_model.dart';
part 'search_result_no_data_found_state.dart';

final searchResultNoDataFoundNotifier = StateNotifierProvider<
    SearchResultNoDataFoundNotifier, SearchResultNoDataFoundState>(
  (ref) => SearchResultNoDataFoundNotifier(SearchResultNoDataFoundState(
    searchController: TextEditingController(),
    selectedDropDownValue: SelectionPopupModel(title: ''),
    searchResultNoDataFoundModelObj:
        SearchResultNoDataFoundModel(dropdownItemList: [
      SelectionPopupModel(
        id: 1,
        title: "Item One",
        isSelected: true,
      ),
      SelectionPopupModel(
        id: 2,
        title: "Item Two",
      ),
      SelectionPopupModel(
        id: 3,
        title: "Item Three",
      )
    ]),
  )),
);

/// A notifier that manages the state of a SearchResultNoDataFound according to the event that is dispatched to it.
class SearchResultNoDataFoundNotifier
    extends StateNotifier<SearchResultNoDataFoundState> {
  SearchResultNoDataFoundNotifier(SearchResultNoDataFoundState state)
      : super(state) {}
}
