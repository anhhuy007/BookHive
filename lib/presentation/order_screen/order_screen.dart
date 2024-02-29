import '../order_screen/widgets/orders_item_widget.dart';
import 'models/orders_item_model.dart';
import 'notifier/order_notifier.dart';
import 'package:flutter/material.dart';
import 'package:loginform/core/app_export.dart';
import 'package:loginform/widgets/app_bar/appbar_leading_image.dart';
import 'package:loginform/widgets/app_bar/appbar_subtitle.dart';
import 'package:loginform/widgets/app_bar/custom_app_bar.dart';

class OrderScreen extends ConsumerStatefulWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  OrderScreenState createState() => OrderScreenState();
}

class OrderScreenState extends ConsumerState<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(context),
            body: Padding(
                padding: EdgeInsets.only(left: 15.h, top: 19.v, right: 15.h),
                child: Consumer(builder: (context, ref, _) {
                  return ListView.separated(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      separatorBuilder: (context, index) {
                        return Padding(
                            padding: EdgeInsets.symmetric(vertical: 5.0.v),
                            child: SizedBox(
                                width: 344.h,
                                child: Divider(
                                    height: 1.v,
                                    thickness: 1.v,
                                    color: appTheme.blue50)));
                      },
                      itemCount: ref
                              .watch(orderNotifier)
                              .orderModelObj
                              ?.ordersItemList
                              .length ??
                          0,
                      itemBuilder: (context, index) {
                        OrdersItemModel model = ref
                                .watch(orderNotifier)
                                .orderModelObj
                                ?.ordersItemList[index] ??
                            OrdersItemModel();
                        return OrdersItemWidget(model);
                      });
                }))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 40.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgArrowLeft,
            margin: EdgeInsets.only(left: 16.h, top: 15.v, bottom: 16.v),
            onTap: () {
              onTapArrowLeft(context);
            }),
        title: AppbarSubtitle(
            text: "lbl_order".tr, margin: EdgeInsets.only(left: 12.h)));
  }

  /// Navigates back to the previous screen.
  onTapArrowLeft(BuildContext context) {
    NavigatorService.goBack();
  }
}
