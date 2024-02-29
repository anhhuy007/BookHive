import 'models/search_result_no_data_found_model.dart';
import 'notifier/search_result_no_data_found_notifier.dart';
import 'package:flutter/material.dart';
import 'package:loginform/core/app_export.dart';
import 'package:loginform/widgets/app_bar/appbar_title_image.dart';
import 'package:loginform/widgets/app_bar/appbar_title_searchview.dart';
import 'package:loginform/widgets/app_bar/custom_app_bar.dart';
import 'package:loginform/widgets/custom_drop_down.dart';
import 'package:loginform/widgets/custom_elevated_button.dart';
import 'package:loginform/widgets/custom_icon_button.dart';

class SearchResultNoDataFoundScreen extends ConsumerStatefulWidget {
  const SearchResultNoDataFoundScreen({Key? key})
      : super(
          key: key,
        );

  @override
  SearchResultNoDataFoundScreenState createState() =>
      SearchResultNoDataFoundScreenState();
}

class SearchResultNoDataFoundScreenState
    extends ConsumerState<SearchResultNoDataFoundScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(
            horizontal: 16.h,
            vertical: 15.v,
          ),
          child: Column(
            children: [
              _buildResultCounter(context),
              Spacer(
                flex: 32,
              ),
              _buildNoData(context),
              SizedBox(height: 16.v),
              CustomElevatedButton(
                text: "lbl_back_to_home".tr,
              ),
              Spacer(
                flex: 67,
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      height: 79.v,
      centerTitle: true,
      title: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.h),
            child: Row(
              children: [
                Consumer(
                  builder: (context, ref, _) {
                    return AppbarTitleSearchview(
                      hintText: "lbl_search_product".tr,
                      controller: ref
                          .watch(searchResultNoDataFoundNotifier)
                          .searchController,
                    );
                  },
                ),
                AppbarTitleImage(
                  imagePath: ImageConstant.imgShortIcon,
                  margin: EdgeInsets.only(
                    left: 16.h,
                    top: 11.v,
                    bottom: 11.v,
                  ),
                ),
                AppbarTitleImage(
                  imagePath: ImageConstant.imgFilter,
                  margin: EdgeInsets.only(
                    left: 16.h,
                    top: 11.v,
                    bottom: 11.v,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 16.v),
          SizedBox(
            width: double.maxFinite,
            child: Divider(),
          ),
        ],
      ),
      styleType: Style.bgFill_1,
    );
  }

  /// Section Widget
  Widget _buildResultCounter(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Opacity(
          opacity: 0.5,
          child: Padding(
            padding: EdgeInsets.only(
              top: 1.v,
              bottom: 4.v,
            ),
            child: Text(
              "lbl_0_result".tr,
              style: CustomTextStyles.labelLargeOnPrimary,
            ),
          ),
        ),
        Consumer(
          builder: (context, ref, _) {
            return CustomDropDown(
              width: 103.h,
              icon: Container(
                margin: EdgeInsets.only(left: 8.h),
                child: CustomImageView(
                  imagePath: ImageConstant.imgDownIcon,
                  height: 24.adaptSize,
                  width: 24.adaptSize,
                ),
              ),
              hintText: "lbl_man_shoes".tr,
              items: ref
                      .watch(searchResultNoDataFoundNotifier)
                      .searchResultNoDataFoundModelObj
                      ?.dropdownItemList ??
                  [],
              onChanged: (value) {
                ref
                    .watch(searchResultNoDataFoundNotifier)
                    .selectedDropDownValue = value;
              },
            );
          },
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildNoData(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 53.h),
      child: Column(
        children: [
          CustomIconButton(
            height: 72.adaptSize,
            width: 72.adaptSize,
            padding: EdgeInsets.all(28.h),
            decoration: IconButtonStyleHelper.outlinePrimary,
            child: CustomImageView(
              imagePath: ImageConstant.imgCloseOnprimarycontainer,
            ),
          ),
          SizedBox(height: 15.v),
          Text(
            "msg_product_not_found".tr,
            style: CustomTextStyles.headlineSmallOnPrimary,
          ),
          SizedBox(height: 11.v),
          Text(
            "msg_thank_you_for_shopping".tr,
            style: theme.textTheme.bodySmall,
          ),
        ],
      ),
    );
  }
}
