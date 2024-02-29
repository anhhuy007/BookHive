import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import '../models/offerscreen_item_model.dart';
import 'package:loginform/presentation/offer_screen_page/models/offer_screen_model.dart';
part 'offer_screen_state.dart';

final offerScreenNotifier =
    StateNotifierProvider<OfferScreenNotifier, OfferScreenState>(
        (ref) => OfferScreenNotifier(OfferScreenState(
                offerScreenModelObj: OfferScreenModel(offerscreenItemList: [
              OfferscreenItemModel(
                  image: ImageConstant.imgPromotionImage,
                  offer: "Super Flash Sale\n50% Off",
                  hours: "08",
                  text: ":",
                  minutes: "34",
                  text1: ":",
                  secounds: "52"),
              OfferscreenItemModel(
                  image: ImageConstant.imgRecomendedProduct,
                  offer: "90% Off Super Mega Sale")
            ]))));

/// A notifier that manages the state of a OfferScreen according to the event that is dispatched to it.
class OfferScreenNotifier extends StateNotifier<OfferScreenState> {
  OfferScreenNotifier(OfferScreenState state) : super(state);
}
