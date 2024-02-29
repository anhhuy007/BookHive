import 'notifier/search_notifier.dart';
import 'package:flutter/material.dart';
import 'package:loginform/core/app_export.dart';
import 'package:loginform/widgets/app_bar/appbar_title_image.dart';
import 'package:loginform/widgets/app_bar/appbar_title_searchview_one.dart';
import 'package:loginform/widgets/app_bar/custom_app_bar.dart';

class SearchScreen extends ConsumerStatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  SearchScreenState createState() => SearchScreenState();
}

class SearchScreenState extends ConsumerState<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(context),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 26.v),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                          onTap: () {
                            onTapTxtNikeAirMaxReact(context);
                          },
                          child: Text("msg_nike_air_max_2703".tr,
                              style: theme.textTheme.bodySmall)),
                      SizedBox(height: 37.v),
                      Text("msg_nike_air_vapormax".tr,
                          style: theme.textTheme.bodySmall),
                      SizedBox(height: 34.v),
                      Text("msg_nike_air_max_2703".tr,
                          style: theme.textTheme.bodySmall),
                      SizedBox(height: 36.v),
                      Text("msg_nike_air_max_2704".tr,
                          style: theme.textTheme.bodySmall),
                      SizedBox(height: 37.v),
                      Text("msg_nike_air_vapormax2".tr,
                          style: theme.textTheme.bodySmall),
                      SizedBox(height: 35.v),
                      Text("msg_nike_air_max_97".tr,
                          style: theme.textTheme.bodySmall),
                      SizedBox(height: 5.v)
                    ]))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        height: 79.v,
        centerTitle: true,
        title: Column(children: [
          Padding(
              padding: EdgeInsets.only(left: 10.h, right: 16.h),
              child: Row(children: [
                Consumer(builder: (context, ref, _) {
                  return AppbarTitleSearchviewOne(
                      hintText: "lbl_nike_air_max".tr,
                      controller: ref.watch(searchNotifier).searchController);
                }),
                AppbarTitleImage(
                    imagePath: ImageConstant.imgMicIcon,
                    margin:
                        EdgeInsets.only(left: 28.h, top: 10.v, bottom: 10.v))
              ])),
          SizedBox(height: 17.v),
          SizedBox(width: 369.h, child: Divider())
        ]),
        styleType: Style.bgFill);
  }

  /// Navigates to the searchResultScreen when the action is triggered.
  onTapTxtNikeAirMaxReact(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.searchResultScreen,
    );
  }
}
