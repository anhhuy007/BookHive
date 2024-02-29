import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import '../models/categoriesgrid_item_model.dart';
import '../models/categoriesgrid1_item_model.dart';
import 'package:loginform/presentation/explore_page/models/explore_model.dart';
part 'explore_state.dart';

final exploreNotifier = StateNotifierProvider<ExploreNotifier, ExploreState>(
    (ref) => ExploreNotifier(ExploreState(
        searchController: TextEditingController(),
        exploreModelObj: ExploreModel(categoriesgridItemList: [
          CategoriesgridItemModel(
              manWorkEquipment: ImageConstant.imgManWorkEquipment,
              officeBag: "Office Bag"),
          CategoriesgridItemModel(
              manWorkEquipment: ImageConstant.imgArrowRight,
              officeBag: "Shirt"),
          CategoriesgridItemModel(
              manWorkEquipment: ImageConstant.imgManTShirtIcon,
              officeBag: "T-Shirt"),
          CategoriesgridItemModel(
              manWorkEquipment: ImageConstant.imgManShoesIcon,
              officeBag: "Shoes"),
          CategoriesgridItemModel(
              manWorkEquipment: ImageConstant.imgManPantsIcon,
              officeBag: "Pants"),
          CategoriesgridItemModel(
              manWorkEquipment: ImageConstant.imgManUnderwearIcon,
              officeBag: "Underwear")
        ], categoriesgrid1ItemList: [
          Categoriesgrid1ItemModel(
              womanTShirtIcon: ImageConstant.imgWomanTShirtIcon,
              tShirt: "T-Shirt"),
          Categoriesgrid1ItemModel(
              womanTShirtIcon: ImageConstant.imgDressIcon, tShirt: "Dress"),
          Categoriesgrid1ItemModel(
              womanTShirtIcon: ImageConstant.imgWomanPantsIcon,
              tShirt: "Pants"),
          Categoriesgrid1ItemModel(
              womanTShirtIcon: ImageConstant.imgSkirtIcon, tShirt: "Skirt"),
          Categoriesgrid1ItemModel(
              womanTShirtIcon: ImageConstant.imgWomanBagIcon, tShirt: "Bag"),
          Categoriesgrid1ItemModel(
              womanTShirtIcon: ImageConstant.imgHighHeelsIcon, tShirt: "Heels"),
          Categoriesgrid1ItemModel(
              womanTShirtIcon: ImageConstant.imgBikiniIcon, tShirt: "Bikini")
        ]))));

/// A notifier that manages the state of a Explore according to the event that is dispatched to it.
class ExploreNotifier extends StateNotifier<ExploreState> {
  ExploreNotifier(ExploreState state) : super(state);
}
