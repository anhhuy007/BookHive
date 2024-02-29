import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import '../models/conditionchipview_item_model.dart';
import '../models/buyingformatchipview_item_model.dart';
import '../models/itemlocationchipview_item_model.dart';
import '../models/showonly_item_model.dart';
import 'package:loginform/presentation/filter_screen/models/filter_model.dart';
part 'filter_state.dart';

final filterNotifier = StateNotifierProvider<FilterNotifier, FilterState>(
    (ref) => FilterNotifier(FilterState(
        priceController: TextEditingController(),
        priceController1: TextEditingController(),
        filterModelObj: FilterModel(
            conditionchipviewItemList:
                List.generate(3, (index) => ConditionchipviewItemModel()),
            buyingformatchipviewItemList:
                List.generate(5, (index) => BuyingformatchipviewItemModel()),
            itemlocationchipviewItemList:
                List.generate(4, (index) => ItemlocationchipviewItemModel()),
            showonlyItemList:
                List.generate(11, (index) => ShowonlyItemModel())))));

/// A notifier that manages the state of a Filter according to the event that is dispatched to it.
class FilterNotifier extends StateNotifier<FilterState> {
  FilterNotifier(FilterState state) : super(state);

  void onSelectedChipView1(
    int index,
    bool value,
  ) {
    List<ConditionchipviewItemModel> newList =
        List<ConditionchipviewItemModel>.from(
            state.filterModelObj!.conditionchipviewItemList);
    newList[index] = newList[index].copyWith(isSelected: value);
    state = state.copyWith(
        filterModelObj:
            state.filterModelObj?.copyWith(conditionchipviewItemList: newList));
  }

  void onSelectedChipView2(
    int index,
    bool value,
  ) {
    List<BuyingformatchipviewItemModel> newList =
        List<BuyingformatchipviewItemModel>.from(
            state.filterModelObj!.buyingformatchipviewItemList);
    newList[index] = newList[index].copyWith(isSelected: value);
    state = state.copyWith(
        filterModelObj: state.filterModelObj
            ?.copyWith(buyingformatchipviewItemList: newList));
  }

  void onSelectedChipView3(
    int index,
    bool value,
  ) {
    List<ItemlocationchipviewItemModel> newList =
        List<ItemlocationchipviewItemModel>.from(
            state.filterModelObj!.itemlocationchipviewItemList);
    newList[index] = newList[index].copyWith(isSelected: value);
    state = state.copyWith(
        filterModelObj: state.filterModelObj
            ?.copyWith(itemlocationchipviewItemList: newList));
  }

  void onSelectedChipView4(
    int index,
    bool value,
  ) {
    List<ShowonlyItemModel> newList =
        List<ShowonlyItemModel>.from(state.filterModelObj!.showonlyItemList);
    newList[index] = newList[index].copyWith(isSelected: value);
    state = state.copyWith(
        filterModelObj:
            state.filterModelObj?.copyWith(showonlyItemList: newList));
  }
}
