import '../search_result_screen/widgets/searchresult_item_widget.dart';
import 'models/search_result_model.dart';
import 'models/searchresult_item_model.dart';
import 'notifier/search_result_notifier.dart';
import 'package:flutter/material.dart';
import 'package:loginform/core/app_export.dart';
import 'package:loginform/widgets/app_bar/appbar_title_image.dart';
import 'package:loginform/widgets/app_bar/appbar_title_searchview_two.dart';
import 'package:loginform/widgets/app_bar/custom_app_bar.dart';
import 'package:loginform/widgets/custom_drop_down.dart';

class SearchResultScreen extends ConsumerStatefulWidget {
  const SearchResultScreen({Key? key}) : super(key: key);

  @override
  SearchResultScreenState createState() => SearchResultScreenState();
}

class SearchResultScreenState extends ConsumerState<SearchResultScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(context),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 15.v),
                child: Column(children: [
                  _buildResultCounter(context),
                  SizedBox(height: 16.v),
                  _buildSearchResult(context)
                ]))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        height: 79.v,
        centerTitle: true,
        title: Column(children: [
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.h),
              child: Row(children: [
                Consumer(builder: (context, ref, _) {
                  return AppbarTitleSearchviewTwo(
                      hintText: "lbl_nike_air_max".tr,
                      controller:
                          ref.watch(searchResultNotifier).searchController);
                }),
                AppbarTitleImage(
                    imagePath: ImageConstant.imgShortIcon,
                    margin: EdgeInsets.only(left: 16.h, top: 9.v, bottom: 9.v),
                    onTap: () {
                      onTapShortIcon(context);
                    }),
                AppbarTitleImage(
                    imagePath: ImageConstant.imgFilter,
                    margin: EdgeInsets.only(left: 16.h, top: 9.v, bottom: 9.v),
                    onTap: () {
                      onTapFilter(context);
                    })
              ])),
          SizedBox(height: 18.v),
          SizedBox(width: double.maxFinite, child: Divider())
        ]),
        styleType: Style.bgFill_1);
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
                  padding: EdgeInsets.only(top: 1.v, bottom: 4.v),
                  child: Text("lbl_145_result".tr,
                      style: CustomTextStyles.labelLargeOnPrimary))),
          Consumer(builder: (context, ref, _) {
            return CustomDropDown(
                width: 103.h,
                icon: Container(
                    margin: EdgeInsets.only(left: 8.h),
                    child: CustomImageView(
                        imagePath: ImageConstant.imgDownIcon,
                        height: 24.adaptSize,
                        width: 24.adaptSize)),
                hintText: "lbl_man_shoes".tr,
                items: ref
                        .watch(searchResultNotifier)
                        .searchResultModelObj
                        ?.dropdownItemList ??
                    [],
                onChanged: (value) {
                  ref.watch(searchResultNotifier).selectedDropDownValue = value;
                });
          })
        ]);
  }

  /// Section Widget
  Widget _buildSearchResult(BuildContext context) {
    return Expanded(child: Consumer(builder: (context, ref, _) {
      return GridView.builder(
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisExtent: 283.v,
              crossAxisCount: 2,
              mainAxisSpacing: 13.h,
              crossAxisSpacing: 13.h),
          physics: BouncingScrollPhysics(),
          itemCount: ref
                  .watch(searchResultNotifier)
                  .searchResultModelObj
                  ?.searchresultItemList
                  .length ??
              0,
          itemBuilder: (context, index) {
            SearchresultItemModel model = ref
                    .watch(searchResultNotifier)
                    .searchResultModelObj
                    ?.searchresultItemList[index] ??
                SearchresultItemModel();
            return SearchresultItemWidget(model);
          });
    }));
  }

  /// Navigates to the sortByScreen when the action is triggered.
  onTapShortIcon(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.sortByScreen,
    );
  }

  /// Navigates to the filterScreen when the action is triggered.
  onTapFilter(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.filterScreen,
    );
  }
}
