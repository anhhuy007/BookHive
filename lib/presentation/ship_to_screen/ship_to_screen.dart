import '../ship_to_screen/widgets/shiptolist_item_widget.dart';
import 'models/shiptolist_item_model.dart';
import 'notifier/ship_to_notifier.dart';
import 'package:flutter/material.dart';
import 'package:loginform/core/app_export.dart';
import 'package:loginform/widgets/app_bar/appbar_leading_image.dart';
import 'package:loginform/widgets/app_bar/appbar_subtitle.dart';
import 'package:loginform/widgets/app_bar/appbar_trailing_image.dart';
import 'package:loginform/widgets/app_bar/custom_app_bar.dart';
import 'package:loginform/widgets/custom_elevated_button.dart';

class ShipToScreen extends ConsumerStatefulWidget {
  const ShipToScreen({Key? key}) : super(key: key);

  @override
  ShipToScreenState createState() => ShipToScreenState();
}

class ShipToScreenState extends ConsumerState<ShipToScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(context),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(vertical: 23.v),
                child: Column(children: [
                  SizedBox(height: 4.v),
                  _buildShipToList(context)
                ])),
            bottomNavigationBar: _buildNextButton(context)));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 40.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgArrowLeft,
            margin: EdgeInsets.only(left: 16.h, top: 13.v, bottom: 14.v),
            onTap: () {
              onTapArrowLeft(context);
            }),
        title: AppbarSubtitle(
            text: "lbl_ship_to".tr, margin: EdgeInsets.only(left: 12.h)),
        actions: [
          AppbarTrailingImage(
              imagePath: ImageConstant.imgPlusIcon,
              margin: EdgeInsets.fromLTRB(16.h, 13.v, 16.h, 14.v))
        ]);
  }

  /// Section Widget
  Widget _buildShipToList(BuildContext context) {
    return Expanded(
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.h),
            child: Consumer(builder: (context, ref, _) {
              return ListView.separated(
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  separatorBuilder: (context, index) {
                    return SizedBox(height: 22.v);
                  },
                  itemCount: ref
                          .watch(shipToNotifier)
                          .shipToModelObj
                          ?.shiptolistItemList
                          .length ??
                      0,
                  itemBuilder: (context, index) {
                    ShiptolistItemModel model = ref
                            .watch(shipToNotifier)
                            .shipToModelObj
                            ?.shiptolistItemList[index] ??
                        ShiptolistItemModel();
                    return ShiptolistItemWidget(model);
                  });
            })));
  }

  /// Section Widget
  Widget _buildNextButton(BuildContext context) {
    return CustomElevatedButton(
        text: "lbl_next".tr,
        margin: EdgeInsets.only(left: 16.h, right: 16.h, bottom: 50.v),
        onPressed: () {
          onTapNextButton(context);
        });
  }

  /// Navigates back to the previous screen.
  onTapArrowLeft(BuildContext context) {
    NavigatorService.goBack();
  }

  /// Navigates to the paymentMethodScreen when the action is triggered.
  onTapNextButton(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.paymentMethodScreen,
    );
  }
}
