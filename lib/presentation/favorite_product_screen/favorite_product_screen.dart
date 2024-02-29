import '../favorite_product_screen/widgets/favoriteproduct_item_widget.dart';
import 'models/favoriteproduct_item_model.dart';
import 'notifier/favorite_product_notifier.dart';
import 'package:flutter/material.dart';
import 'package:loginform/core/app_export.dart';
import 'package:loginform/widgets/app_bar/appbar_leading_image.dart';
import 'package:loginform/widgets/app_bar/appbar_subtitle.dart';
import 'package:loginform/widgets/app_bar/custom_app_bar.dart';

class FavoriteProductScreen extends ConsumerStatefulWidget {
  const FavoriteProductScreen({Key? key}) : super(key: key);

  @override
  FavoriteProductScreenState createState() => FavoriteProductScreenState();
}

class FavoriteProductScreenState extends ConsumerState<FavoriteProductScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(context),
            body: Padding(
                padding: EdgeInsets.only(left: 16.h, top: 8.v, right: 16.h),
                child: Consumer(builder: (context, ref, _) {
                  return GridView.builder(
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          mainAxisExtent: 283.v,
                          crossAxisCount: 2,
                          mainAxisSpacing: 13.h,
                          crossAxisSpacing: 13.h),
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: ref
                              .watch(favoriteProductNotifier)
                              .favoriteProductModelObj
                              ?.favoriteproductItemList
                              .length ??
                          0,
                      itemBuilder: (context, index) {
                        FavoriteproductItemModel model = ref
                                .watch(favoriteProductNotifier)
                                .favoriteProductModelObj
                                ?.favoriteproductItemList[index] ??
                            FavoriteproductItemModel();
                        return FavoriteproductItemWidget(model,
                            onTapProductItem: () {
                          onTapProductItem(context);
                        });
                      });
                }))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 40.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgArrowLeft,
            margin: EdgeInsets.only(left: 16.h, top: 16.v, bottom: 15.v),
            onTap: () {
              onTapArrowLeft(context);
            }),
        title: AppbarSubtitle(
            text: "msg_favorite_product".tr,
            margin: EdgeInsets.only(left: 12.h)));
  }

  /// Navigates to the productDetailScreen when the action is triggered.
  onTapProductItem(BuildContext context) {
    NavigatorService.pushNamed(AppRoutes.productDetailScreen);
  }

  /// Navigates back to the previous screen.
  onTapArrowLeft(BuildContext context) {
    NavigatorService.goBack();
  }
}
