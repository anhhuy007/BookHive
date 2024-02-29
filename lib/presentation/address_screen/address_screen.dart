import '../address_screen/widgets/addresses_item_widget.dart';
import 'models/addresses_item_model.dart';
import 'notifier/address_notifier.dart';
import 'package:flutter/material.dart';
import 'package:loginform/core/app_export.dart';
import 'package:loginform/widgets/app_bar/appbar_leading_image.dart';
import 'package:loginform/widgets/app_bar/appbar_subtitle.dart';
import 'package:loginform/widgets/app_bar/custom_app_bar.dart';
import 'package:loginform/widgets/custom_elevated_button.dart';

class AddressScreen extends ConsumerStatefulWidget {
  const AddressScreen({Key? key}) : super(key: key);

  @override
  AddressScreenState createState() => AddressScreenState();
}

class AddressScreenState extends ConsumerState<AddressScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(context),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(vertical: 10.v),
                child: Column(children: [
                  SizedBox(height: 17.v),
                  _buildAddresses(context),
                  Spacer()
                ])),
            bottomNavigationBar: _buildAddAddress(context)));
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
            text: "lbl_address".tr, margin: EdgeInsets.only(left: 12.h)));
  }

  /// Section Widget
  Widget _buildAddresses(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.h),
        child: Consumer(builder: (context, ref, _) {
          return ListView.separated(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              separatorBuilder: (context, index) {
                return SizedBox(height: 18.v);
              },
              itemCount: ref
                      .watch(addressNotifier)
                      .addressModelObj
                      ?.addressesItemList
                      .length ??
                  0,
              itemBuilder: (context, index) {
                AddressesItemModel model = ref
                        .watch(addressNotifier)
                        .addressModelObj
                        ?.addressesItemList[index] ??
                    AddressesItemModel();
                return AddressesItemWidget(model);
              });
        }));
  }

  /// Section Widget
  Widget _buildAddAddress(BuildContext context) {
    return CustomElevatedButton(
        text: "lbl_add_address".tr,
        margin: EdgeInsets.only(left: 16.h, right: 16.h, bottom: 50.v));
  }

  /// Navigates back to the previous screen.
  onTapArrowLeft(BuildContext context) {
    NavigatorService.goBack();
  }
}
