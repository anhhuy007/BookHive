import 'notifier/write_review_fill_notifier.dart';
import 'package:flutter/material.dart';
import 'package:loginform/core/app_export.dart';
import 'package:loginform/widgets/app_bar/appbar_leading_image.dart';
import 'package:loginform/widgets/app_bar/appbar_subtitle.dart';
import 'package:loginform/widgets/app_bar/custom_app_bar.dart';
import 'package:loginform/widgets/custom_elevated_button.dart';
import 'package:loginform/widgets/custom_rating_bar.dart';
import 'package:loginform/widgets/custom_text_form_field.dart';

class WriteReviewFillScreen extends ConsumerStatefulWidget {
  const WriteReviewFillScreen({Key? key}) : super(key: key);

  @override
  WriteReviewFillScreenState createState() => WriteReviewFillScreenState();
}

class WriteReviewFillScreenState extends ConsumerState<WriteReviewFillScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: _buildAppBar(context),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 15.h, vertical: 27.v),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildReview(context),
                      SizedBox(height: 22.v),
                      Text("msg_write_your_review".tr,
                          style: theme.textTheme.titleSmall),
                      SizedBox(height: 13.v),
                      Consumer(builder: (context, ref, _) {
                        return CustomTextFormField(
                            controller: ref
                                .watch(writeReviewFillNotifier)
                                .addReviewController,
                            hintText: "lbl_add_review".tr,
                            hintStyle: CustomTextStyles.labelLargeBluegray300,
                            textInputAction: TextInputAction.done,
                            maxLines: 8,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 16.h, vertical: 17.v));
                      }),
                      SizedBox(height: 5.v)
                    ])),
            bottomNavigationBar: _buildWriteReviewButton(context)));
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
            text: "lbl_write_review".tr, margin: EdgeInsets.only(left: 12.h)));
  }

  /// Section Widget
  Widget _buildReview(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      SizedBox(
          width: 343.h,
          child: Text("msg_please_write_overall".tr,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.titleSmall!.copyWith(height: 1.50))),
      SizedBox(height: 13.v),
      CustomRatingBar(initialRating: 4, itemSize: 32)
    ]);
  }

  /// Section Widget
  Widget _buildWriteReviewButton(BuildContext context) {
    return CustomElevatedButton(
        text: "lbl_write_review".tr,
        margin: EdgeInsets.only(left: 16.h, right: 16.h, bottom: 34.v));
  }

  /// Navigates back to the previous screen.
  onTapArrowLeft(BuildContext context) {
    NavigatorService.goBack();
  }
}
