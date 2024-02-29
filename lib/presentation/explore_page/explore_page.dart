import '../explore_page/widgets/categoriesgrid1_item_widget.dart';
import '../explore_page/widgets/categoriesgrid_item_widget.dart';
import 'models/categoriesgrid1_item_model.dart';
import 'models/categoriesgrid_item_model.dart';
import 'notifier/explore_notifier.dart';
import 'package:flutter/material.dart';
import 'package:loginform/core/app_export.dart';
import 'package:loginform/widgets/app_bar/appbar_title_searchview.dart';
import 'package:loginform/widgets/app_bar/appbar_trailing_image.dart';
import 'package:loginform/widgets/app_bar/custom_app_bar.dart';

class ExplorePage extends ConsumerStatefulWidget {
  const ExplorePage({Key? key}) : super(key: key);

  @override
  ExplorePageState createState() => ExplorePageState();
}

class ExplorePageState extends ConsumerState<ExplorePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(context),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 25.v),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("lbl_man_fashion".tr,
                          style: theme.textTheme.titleSmall),
                      SizedBox(height: 13.v),
                      _buildCategoriesGrid(context),
                      SizedBox(height: 37.v),
                      Text("lbl_woman_fashion".tr,
                          style: theme.textTheme.titleSmall),
                      SizedBox(height: 13.v),
                      _buildCategoriesGrid1(context)
                    ]))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        title: Consumer(builder: (context, ref, _) {
          return AppbarTitleSearchview(
              margin: EdgeInsets.only(left: 16.h),
              hintText: "lbl_search_product".tr,
              controller: ref.watch(exploreNotifier).searchController);
        }),
        actions: [
          AppbarTrailingImage(
              imagePath: ImageConstant.imgLoveIcon,
              margin: EdgeInsets.only(left: 16.h, top: 16.v, right: 16.h)),
          Container(
              height: 24.adaptSize,
              width: 24.adaptSize,
              margin: EdgeInsets.only(left: 16.h, top: 16.v, right: 32.h),
              child: Stack(alignment: Alignment.topRight, children: [
                CustomImageView(
                    imagePath: ImageConstant.imgNotificationIcon,
                    height: 24.adaptSize,
                    width: 24.adaptSize,
                    alignment: Alignment.center,
                    onTap: () {
                      onTapImgNotificationIcon(context);
                    }),
                CustomImageView(
                    imagePath: ImageConstant.imgClosePink300,
                    height: 8.adaptSize,
                    width: 8.adaptSize,
                    alignment: Alignment.topRight,
                    margin:
                        EdgeInsets.only(left: 14.h, right: 2.h, bottom: 16.v))
              ]))
        ]);
  }

  /// Section Widget
  Widget _buildCategoriesGrid(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      return GridView.builder(
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisExtent: 94.v,
              crossAxisCount: 4,
              mainAxisSpacing: 21.h,
              crossAxisSpacing: 21.h),
          physics: NeverScrollableScrollPhysics(),
          itemCount: ref
                  .watch(exploreNotifier)
                  .exploreModelObj
                  ?.categoriesgridItemList
                  .length ??
              0,
          itemBuilder: (context, index) {
            CategoriesgridItemModel model = ref
                    .watch(exploreNotifier)
                    .exploreModelObj
                    ?.categoriesgridItemList[index] ??
                CategoriesgridItemModel();
            return CategoriesgridItemWidget(model);
          });
    });
  }

  /// Section Widget
  Widget _buildCategoriesGrid1(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      return GridView.builder(
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisExtent: 93.v,
              crossAxisCount: 4,
              mainAxisSpacing: 21.h,
              crossAxisSpacing: 21.h),
          physics: NeverScrollableScrollPhysics(),
          itemCount: ref
                  .watch(exploreNotifier)
                  .exploreModelObj
                  ?.categoriesgrid1ItemList
                  .length ??
              0,
          itemBuilder: (context, index) {
            Categoriesgrid1ItemModel model = ref
                    .watch(exploreNotifier)
                    .exploreModelObj
                    ?.categoriesgrid1ItemList[index] ??
                Categoriesgrid1ItemModel();
            return Categoriesgrid1ItemWidget(model);
          });
    });
  }

  /// Navigates to the notificationScreen when the action is triggered.
  onTapImgNotificationIcon(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.notificationScreen,
    );
  }
}
