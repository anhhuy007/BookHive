import '../offer_screen_page/widgets/offerscreen_item_widget.dart';
import 'models/offerscreen_item_model.dart';
import 'notifier/offer_screen_notifier.dart';
import 'package:flutter/material.dart';
import 'package:loginform/core/app_export.dart';
import 'package:loginform/widgets/app_bar/appbar_title.dart';
import 'package:loginform/widgets/app_bar/appbar_trailing_image.dart';
import 'package:loginform/widgets/app_bar/custom_app_bar.dart';

class OfferScreenPage extends ConsumerStatefulWidget {
  const OfferScreenPage({Key? key}) : super(key: key);

  @override
  OfferScreenPageState createState() => OfferScreenPageState();
}

class OfferScreenPageState extends ConsumerState<OfferScreenPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(context),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 28.v),
                child: Column(children: [
                  _buildCuponPromotion(context),
                  SizedBox(height: 16.v),
                  _buildOfferScreen(context)
                ]))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        title: AppbarTitle(
            text: "lbl_offer".tr, margin: EdgeInsets.only(left: 16.h)),
        actions: [
          AppbarTrailingImage(
              imagePath: ImageConstant.imgNotificationIcon,
              margin: EdgeInsets.fromLTRB(13.h, 16.v, 13.h, 15.v),
              onTap: () {
                onTapNotificationIcon(context);
              })
        ]);
  }

  /// Section Widget
  Widget _buildCuponPromotion(BuildContext context) {
    return Container(
        width: 343.h,
        padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 14.v),
        decoration: AppDecoration.fillPrimary
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder5),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 3.v),
              SizedBox(
                  width: 201.h,
                  child: Text("msg_use_megsl_cupon".tr,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: CustomTextStyles.titleMediumOnPrimaryContainer
                          .copyWith(height: 1.50)))
            ]));
  }

  /// Section Widget
  Widget _buildOfferScreen(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      return ListView.separated(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          separatorBuilder: (context, index) {
            return SizedBox(height: 16.v);
          },
          itemCount: ref
                  .watch(offerScreenNotifier)
                  .offerScreenModelObj
                  ?.offerscreenItemList
                  .length ??
              0,
          itemBuilder: (context, index) {
            OfferscreenItemModel model = ref
                    .watch(offerScreenNotifier)
                    .offerScreenModelObj
                    ?.offerscreenItemList[index] ??
                OfferscreenItemModel();
            return OfferscreenItemWidget(model);
          });
    });
  }

  /// Navigates to the notificationScreen when the action is triggered.
  onTapNotificationIcon(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.notificationScreen,
    );
  }
}
