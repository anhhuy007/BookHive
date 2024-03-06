import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:loginform/data/api/endpoint.dart';
import 'package:loginform/presentation/dashboard_page/models/category_item_model.dart';
import 'package:loginform/presentation/dashboard_page/repository/dashboard_repo.dart';
import 'package:loginform/presentation/dashboard_page/repository/remote_datasource.dart';
import 'package:pocketbase/pocketbase.dart';
import '/core/app_export.dart';
import '../models/offerbanner_item_model.dart';
import '../models/flashsale_item_model.dart';
import '../models/megasale_item_model.dart';
import '../models/products_item_model.dart';
import 'package:loginform/presentation/dashboard_page/models/dashboard_model.dart';
import 'package:logging_to_logcat/logging_to_logcat.dart';
import 'package:logging/logging.dart';

part 'dashboard_state.dart';

// Data provider
final dashboardDataSourceProvider = Provider<DashBoardDataSource>((_) {
  return DashBoardRemoteDataSource();
});

final dashboardRepositoryProvider = Provider<DashBoardRepository>((ref) {
  final datasource = ref.watch(dashboardDataSourceProvider);
  return DashBoardRepository(dashBoardDataSource: datasource);
});

final dashboardNotifierProvider =
    StateNotifierProvider<DashboardNotifier, DashboardState>((ref) {
  final repo = ref.watch(dashboardRepositoryProvider);
  return DashboardNotifier(repo)..fetchDashboardData();
});
/*
StateNotifierProvider<DashboardNotifier, DashboardState>((ref) =>
    DashboardNotifier(DashboardState(
        sliderIndex: 0,
        dashboardModelObj: DashboardModel(
            offerbannerItemList:
            List.generate(1, (index) => OfferbannerItemModel()),
            categoriesItemList: List.generate(0, (index) => CategoryItem()),
            flashsaleItemList: [
              FlashsaleItemModel(
                  image: ImageConstant.imgProductImage,
                  fSNikeAirMax: "FS - Nike Air Max 270 React...",
                  price: "299,43",
                  price1: "534,33",
                  offer: "24% Off"),
              FlashsaleItemModel(
                  image: ImageConstant.imgProductImage109x109,
                  fSNikeAirMax: "FS - QUILTED MAXI CROS...",
                  price: "299,43",
                  price1: "534,33",
                  offer: "24% Off"),
              FlashsaleItemModel(
                  image: ImageConstant.imgProductImage1,
                  fSNikeAirMax: "FS - Nike Air Max 270 React...",
                  price: "299,43",
                  price1: "534,33",
                  offer: "24% Off")
            ],
            megasaleItemList: [
              MegasaleItemModel(
                  image: ImageConstant.imgProductImage2,
                  mSNikeAirMax: "MS - Nike Air Max 270 React...",
                  price: "299,43",
                  price1: "534,33",
                  offer: "24% Off"),
              MegasaleItemModel(
                  image: ImageConstant.imgProductImage3,
                  mSNikeAirMax: "MS - Nike Air Max 270 React...",
                  price: "299,43",
                  price1: "534,33",
                  offer: "24% Off"),
              MegasaleItemModel(
                  image: ImageConstant.imgProductImage4,
                  mSNikeAirMax: "MS - Nike Air Max 270 React...",
                  price: "299,43",
                  price1: "534,33",
                  offer: "24% Off")
            ],
            productsItemList: [
              ProductsItemModel(
                  image: ImageConstant.imgImageProduct,
                  nikeAirMaxReact: "Nike Air Max 270 React ENG",
                  price: "299,43",
                  price1: "534,33",
                  offer: "24% Off"),
              ProductsItemModel(
                  image: ImageConstant.imgProductImage2,
                  nikeAirMaxReact: "Nike Air Max 270 React ENG",
                  price: "299,43",
                  price1: "534,33",
                  offer: "24% Off"),
              ProductsItemModel(
                  image: ImageConstant.imgProductImage133x133,
                  nikeAirMaxReact: "Nike Air Max 270 React ENG",
                  price: "299,43",
                  price1: "534,33",
                  offer: "24% Off"),
              ProductsItemModel(
                  image: ImageConstant.imgProductImage1,
                  nikeAirMaxReact: "Nike Air Max 270 React ENG",
                  price: "299,43",
                  price1: "534,33",
                  offer: "24% Off")
            ]))));
*/

/// A notifier that manages the state of a Dashboard according to the event that is dispatched to it.
class DashboardNotifier extends StateNotifier<DashboardState> {
  final DashBoardRepository dashboardRepository;

  DashboardNotifier(
    this.dashboardRepository,
  ) : super(DashboardState());

  void changeSliderIndex(int index) {
    state = state.copyWith(sliderIndex: index);
  }

  Future<void> fetchDashboardData() async {
    await Future.wait([
      fetchCategories(),
      fetchBestSeller(),
      fetchBanners(),
    ]);
  }

  Future<void> fetchCategories() async {
    // if data is loaded then return
    if (state.dashboardModelObj.categoriesItemList.isNotEmpty) return;

    state.dashboardConcreteState = DashboardConcreteState.LOADING;
    final response = await dashboardRepository.fetchCategoryItemList();

    response.fold((err) {
      state.dashboardConcreteState = DashboardConcreteState.FAILURE;
      Logger.root.activateLogcat();
      final Logger log = Logger("MyLogger");
      log.info("Error: ", err.message);
    }, (data) {
      state = state.copyWith(
        dashboardModelObj: state.dashboardModelObj.copyWith(
          categoriesItemList: data,
        ),
        dashboardConcreteState: DashboardConcreteState.LOADED,
      );
    });
  }
  Future<void> fetchBestSeller() async {
    // if data is loaded then return
    if (state.dashboardModelObj.bestSellerItemList.isNotEmpty) return;

    state.dashboardConcreteState = DashboardConcreteState.LOADING;
    final response = await dashboardRepository.fetchBestSellerItemList();

    response.fold((err) {
      state.dashboardConcreteState = DashboardConcreteState.FAILURE;
      Logger.root.activateLogcat();
      final Logger log = Logger("MyLogger");
      log.info("Error with book: ", err.message);
    }, (data) {
      state = state.copyWith(
        dashboardModelObj:
            state.dashboardModelObj.copyWith(
                bestSellerItemList: data
            ),
        dashboardConcreteState: DashboardConcreteState.LOADED,
      );
      Logger.root.activateLogcat();
      // Logger("MyLogger")..info("Book data: ${state.dashboardModelObj.bestSellerItemList.length}");
    });
  }
  Future<void> fetchBanners() async {
    // if data is loaded then return
    if (state.dashboardModelObj.offerbannerItemList.isNotEmpty) return;

    state.dashboardConcreteState = DashboardConcreteState.LOADING;
    final response = await dashboardRepository.fetchOfferbannerItemlist();

    response.fold((err) {
      state.dashboardConcreteState = DashboardConcreteState.FAILURE;
      Logger.root.activateLogcat();
      final Logger log = Logger("MyLogger");
      log.info("Error with banner: ", err.message);
    }, (data) {
      state = state.copyWith(
        dashboardModelObj:
            state.dashboardModelObj.copyWith(
                offerbannerItemList: data
            ),
        dashboardConcreteState: DashboardConcreteState.LOADED,
      );
      Logger.root.activateLogcat();
      // Logger("MyLogger")..info("Banner data: ${state.dashboardModelObj.offerbannerItemList.length}");
    });
  }
}
