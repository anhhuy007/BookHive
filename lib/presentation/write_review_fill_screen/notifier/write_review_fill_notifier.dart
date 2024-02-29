import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:loginform/presentation/write_review_fill_screen/models/write_review_fill_model.dart';
part 'write_review_fill_state.dart';

final writeReviewFillNotifier =
    StateNotifierProvider<WriteReviewFillNotifier, WriteReviewFillState>(
        (ref) => WriteReviewFillNotifier(WriteReviewFillState(
            addReviewController: TextEditingController(),
            writeReviewFillModelObj: WriteReviewFillModel())));

/// A notifier that manages the state of a WriteReviewFill according to the event that is dispatched to it.
class WriteReviewFillNotifier extends StateNotifier<WriteReviewFillState> {
  WriteReviewFillNotifier(WriteReviewFillState state) : super(state);
}
