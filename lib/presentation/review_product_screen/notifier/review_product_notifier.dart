import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:loginform/presentation/review_product_screen/models/review_product_model.dart';
part 'review_product_state.dart';

final reviewProductNotifier =
    StateNotifierProvider<ReviewProductNotifier, ReviewProductState>((ref) =>
        ReviewProductNotifier(
            ReviewProductState(reviewProductModelObj: ReviewProductModel())));

/// A notifier that manages the state of a ReviewProduct according to the event that is dispatched to it.
class ReviewProductNotifier extends StateNotifier<ReviewProductState> {
  ReviewProductNotifier(ReviewProductState state) : super(state);
}
