import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:loginform/presentation/sort_by_screen/models/sort_by_model.dart';
part 'sort_by_state.dart';

final sortByNotifier = StateNotifierProvider<SortByNotifier, SortByState>(
    (ref) => SortByNotifier(SortByState(sortByModelObj: SortByModel())));

/// A notifier that manages the state of a SortBy according to the event that is dispatched to it.
class SortByNotifier extends StateNotifier<SortByState> {
  SortByNotifier(SortByState state) : super(state);
}
