import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:loginform/presentation/success_screen/models/success_model.dart';
part 'success_state.dart';

final successNotifier = StateNotifierProvider<SuccessNotifier, SuccessState>(
    (ref) => SuccessNotifier(SuccessState(successModelObj: SuccessModel())));

/// A notifier that manages the state of a Success according to the event that is dispatched to it.
class SuccessNotifier extends StateNotifier<SuccessState> {
  SuccessNotifier(SuccessState state) : super(state);
}
