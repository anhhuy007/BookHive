import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:loginform/presentation/list_category_screen/models/list_category_model.dart';
part 'list_category_state.dart';

final listCategoryNotifier =
    StateNotifierProvider<ListCategoryNotifier, ListCategoryState>((ref) =>
        ListCategoryNotifier(
            ListCategoryState(listCategoryModelObj: ListCategoryModel())));

/// A notifier that manages the state of a ListCategory according to the event that is dispatched to it.
class ListCategoryNotifier extends StateNotifier<ListCategoryState> {
  ListCategoryNotifier(ListCategoryState state) : super(state);
}
