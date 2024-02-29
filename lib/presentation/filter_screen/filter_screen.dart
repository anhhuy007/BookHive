import '../filter_screen/widgets/buyingformatchipview_item_widget.dart';
import '../filter_screen/widgets/conditionchipview_item_widget.dart';
import '../filter_screen/widgets/itemlocationchipview_item_widget.dart';
import '../filter_screen/widgets/showonly_item_widget.dart';
import 'models/buyingformatchipview_item_model.dart';
import 'models/conditionchipview_item_model.dart';
import 'models/itemlocationchipview_item_model.dart';
import 'models/showonly_item_model.dart';
import 'notifier/filter_notifier.dart';
import 'package:flutter/material.dart';
import 'package:loginform/core/app_export.dart';
import 'package:loginform/widgets/app_bar/appbar_leading_image.dart';
import 'package:loginform/widgets/app_bar/appbar_subtitle.dart';
import 'package:loginform/widgets/app_bar/custom_app_bar.dart';
import 'package:loginform/widgets/custom_elevated_button.dart';
import 'package:loginform/widgets/custom_text_form_field.dart';

class FilterScreen extends ConsumerStatefulWidget {
  const FilterScreen({Key? key}) : super(key: key);

  @override
  FilterScreenState createState() => FilterScreenState();
}

class FilterScreenState extends ConsumerState<FilterScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: _buildAppBar(context),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(vertical: 7.v),
                child: Column(children: [
                  SizedBox(height: 31.v),
                  Expanded(
                      child: SingleChildScrollView(
                          child: Container(
                              margin: EdgeInsets.only(bottom: 5.v),
                              padding: EdgeInsets.symmetric(horizontal: 16.h),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("lbl_price_range".tr,
                                        style: theme.textTheme.titleSmall),
                                    SizedBox(height: 11.v),
                                    _buildPriceRow(context),
                                    SizedBox(height: 34.v),
                                    Text("lbl_condition".tr,
                                        style: theme.textTheme.titleSmall),
                                    SizedBox(height: 13.v),
                                    _buildConditionChipView(context),
                                    SizedBox(height: 24.v),
                                    Text("lbl_buying_format".tr,
                                        style: theme.textTheme.titleSmall),
                                    SizedBox(height: 11.v),
                                    _buildBuyingFormatChipView(context),
                                    SizedBox(height: 22.v),
                                    Text("lbl_item_location".tr,
                                        style: theme.textTheme.titleSmall),
                                    SizedBox(height: 13.v),
                                    _buildItemLocationChipView(context),
                                    SizedBox(height: 25.v),
                                    _buildShowOnlyColumn(context)
                                  ]))))
                ])),
            bottomNavigationBar: _buildApplyButton(context)));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 42.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgCloseIcon,
            margin: EdgeInsets.only(left: 18.h, top: 16.v, bottom: 16.v)),
        title: AppbarSubtitle(
            text: "lbl_filter_search".tr, margin: EdgeInsets.only(left: 12.h)));
  }

  /// Section Widget
  Widget _buildPriceRow(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Expanded(
          child: Padding(
              padding: EdgeInsets.only(right: 6.h),
              child: Consumer(builder: (context, ref, _) {
                return CustomTextFormField(
                    controller: ref.watch(filterNotifier).priceController,
                    hintText: "lbl_1_245".tr,
                    hintStyle: CustomTextStyles.labelLargeBluegray300);
              }))),
      Expanded(
          child: Padding(
              padding: EdgeInsets.only(left: 6.h),
              child: Consumer(builder: (context, ref, _) {
                return CustomTextFormField(
                    controller: ref.watch(filterNotifier).priceController1,
                    hintText: "lbl_9_344".tr,
                    hintStyle: CustomTextStyles.labelLargeBluegray300,
                    textInputAction: TextInputAction.done);
              })))
    ]);
  }

  /// Section Widget
  Widget _buildConditionChipView(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      return Wrap(
          runSpacing: 9.v,
          spacing: 9.h,
          children: List<Widget>.generate(
              ref
                      .watch(filterNotifier)
                      .filterModelObj
                      ?.conditionchipviewItemList
                      .length ??
                  0, (index) {
            ConditionchipviewItemModel model = ref
                    .watch(filterNotifier)
                    .filterModelObj
                    ?.conditionchipviewItemList[index] ??
                ConditionchipviewItemModel();
            return ConditionchipviewItemWidget(model,
                onSelectedChipView1: (value) {
              ref
                  .read(filterNotifier.notifier)
                  .onSelectedChipView1(index, value);
            });
          }));
    });
  }

  /// Section Widget
  Widget _buildBuyingFormatChipView(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      return Wrap(
          runSpacing: 8.v,
          spacing: 8.h,
          children: List<Widget>.generate(
              ref
                      .watch(filterNotifier)
                      .filterModelObj
                      ?.buyingformatchipviewItemList
                      .length ??
                  0, (index) {
            BuyingformatchipviewItemModel model = ref
                    .watch(filterNotifier)
                    .filterModelObj
                    ?.buyingformatchipviewItemList[index] ??
                BuyingformatchipviewItemModel();
            return BuyingformatchipviewItemWidget(model,
                onSelectedChipView2: (value) {
              ref
                  .read(filterNotifier.notifier)
                  .onSelectedChipView2(index, value);
            });
          }));
    });
  }

  /// Section Widget
  Widget _buildItemLocationChipView(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      return Wrap(
          runSpacing: 8.v,
          spacing: 8.h,
          children: List<Widget>.generate(
              ref
                      .watch(filterNotifier)
                      .filterModelObj
                      ?.itemlocationchipviewItemList
                      .length ??
                  0, (index) {
            ItemlocationchipviewItemModel model = ref
                    .watch(filterNotifier)
                    .filterModelObj
                    ?.itemlocationchipviewItemList[index] ??
                ItemlocationchipviewItemModel();
            return ItemlocationchipviewItemWidget(model,
                onSelectedChipView3: (value) {
              ref
                  .read(filterNotifier.notifier)
                  .onSelectedChipView3(index, value);
            });
          }));
    });
  }

  /// Section Widget
  Widget _buildShowOnlyColumn(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("lbl_show_only".tr, style: theme.textTheme.titleSmall),
      SizedBox(height: 10.v),
      Consumer(builder: (context, ref, _) {
        return Wrap(
            runSpacing: 8.v,
            spacing: 8.h,
            children: List<Widget>.generate(
                ref
                        .watch(filterNotifier)
                        .filterModelObj
                        ?.showonlyItemList
                        .length ??
                    0, (index) {
              ShowonlyItemModel model = ref
                      .watch(filterNotifier)
                      .filterModelObj
                      ?.showonlyItemList[index] ??
                  ShowonlyItemModel();
              return ShowonlyItemWidget(model, onSelectedChipView4: (value) {
                ref
                    .read(filterNotifier.notifier)
                    .onSelectedChipView4(index, value);
              });
            }));
      })
    ]);
  }

  /// Section Widget
  Widget _buildApplyButton(BuildContext context) {
    return CustomElevatedButton(
        text: "lbl_apply".tr,
        margin: EdgeInsets.only(left: 16.h, right: 16.h, bottom: 50.v),
        onPressed: () {
          onTapApplyButton(context);
        });
  }

  /// Navigates to the searchResultScreen when the action is triggered.
  onTapApplyButton(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.searchResultScreen,
    );
  }
}
