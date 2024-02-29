import 'notifier/change_password_notifier.dart';
import 'package:flutter/material.dart';
import 'package:loginform/core/app_export.dart';
import 'package:loginform/core/utils/validation_functions.dart';
import 'package:loginform/widgets/app_bar/appbar_leading_image.dart';
import 'package:loginform/widgets/app_bar/appbar_subtitle.dart';
import 'package:loginform/widgets/app_bar/custom_app_bar.dart';
import 'package:loginform/widgets/custom_elevated_button.dart';
import 'package:loginform/widgets/custom_text_form_field.dart';

class ChangePasswordScreen extends ConsumerStatefulWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  ChangePasswordScreenState createState() => ChangePasswordScreenState();
}

// ignore_for_file: must_be_immutable
class ChangePasswordScreenState extends ConsumerState<ChangePasswordScreen> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: _buildAppBar(context),
            body: SizedBox(
                width: SizeUtils.width,
                child: SingleChildScrollView(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: Form(
                        key: _formKey,
                        child: Container(
                            width: double.maxFinite,
                            padding: EdgeInsets.symmetric(
                                horizontal: 16.h, vertical: 26.v),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("lbl_old_password".tr,
                                      style: theme.textTheme.titleSmall),
                                  SizedBox(height: 12.v),
                                  _buildOldPassword(context),
                                  SizedBox(height: 23.v),
                                  Text("lbl_new_password".tr,
                                      style: theme.textTheme.titleSmall),
                                  SizedBox(height: 12.v),
                                  _buildNewPassword(context),
                                  SizedBox(height: 24.v),
                                  Text("msg_new_password_again".tr,
                                      style: theme.textTheme.titleSmall),
                                  SizedBox(height: 11.v),
                                  _buildNewPasswordAgain(context),
                                  SizedBox(height: 5.v)
                                ]))))),
            bottomNavigationBar: _buildSave(context)));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 40.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgArrowLeft,
            margin: EdgeInsets.only(left: 16.h, top: 14.v, bottom: 17.v),
            onTap: () {
              onTapArrowLeft(context);
            }),
        title: AppbarSubtitle(
            text: "lbl_change_password".tr,
            margin: EdgeInsets.only(left: 12.h)));
  }

  /// Section Widget
  Widget _buildOldPassword(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      return CustomTextFormField(
          controller: ref.watch(changePasswordNotifier).oldPasswordController,
          hintText: "msg".tr,
          hintStyle: CustomTextStyles.labelLargeBluegray300,
          textInputType: TextInputType.visiblePassword,
          prefix: Container(
              margin: EdgeInsets.fromLTRB(16.h, 12.v, 10.h, 12.v),
              child: CustomImageView(
                  imagePath: ImageConstant.imgLocation,
                  height: 24.adaptSize,
                  width: 24.adaptSize)),
          prefixConstraints: BoxConstraints(maxHeight: 48.v),
          validator: (value) {
            if (value == null || (!isValidPassword(value, isRequired: true))) {
              return "err_msg_please_enter_valid_password".tr;
            }
            return null;
          },
          obscureText: true,
          contentPadding: EdgeInsets.only(top: 15.v, right: 30.h, bottom: 15.v),
          borderDecoration: TextFormFieldStyleHelper.outlineBlueTL5,
          filled: false);
    });
  }

  /// Section Widget
  Widget _buildNewPassword(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      return CustomTextFormField(
          controller: ref.watch(changePasswordNotifier).newPasswordController,
          hintText: "msg".tr,
          hintStyle: CustomTextStyles.labelLargeBluegray300,
          textInputType: TextInputType.visiblePassword,
          prefix: Container(
              margin: EdgeInsets.fromLTRB(16.h, 12.v, 10.h, 12.v),
              child: CustomImageView(
                  imagePath: ImageConstant.imgLocation,
                  height: 24.adaptSize,
                  width: 24.adaptSize)),
          prefixConstraints: BoxConstraints(maxHeight: 48.v),
          validator: (value) {
            if (value == null || (!isValidPassword(value, isRequired: true))) {
              return "err_msg_please_enter_valid_password".tr;
            }
            return null;
          },
          obscureText: true,
          contentPadding: EdgeInsets.only(top: 15.v, right: 30.h, bottom: 15.v),
          borderDecoration: TextFormFieldStyleHelper.outlineBlueTL5,
          filled: false);
    });
  }

  /// Section Widget
  Widget _buildNewPasswordAgain(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      return CustomTextFormField(
          controller:
              ref.watch(changePasswordNotifier).newPasswordAgainController,
          hintText: "msg".tr,
          hintStyle: CustomTextStyles.labelLargeBluegray300,
          textInputAction: TextInputAction.done,
          textInputType: TextInputType.visiblePassword,
          prefix: Container(
              margin: EdgeInsets.fromLTRB(16.h, 12.v, 10.h, 12.v),
              child: CustomImageView(
                  imagePath: ImageConstant.imgLocation,
                  height: 24.adaptSize,
                  width: 24.adaptSize)),
          prefixConstraints: BoxConstraints(maxHeight: 48.v),
          validator: (value) {
            if (value == null || (!isValidPassword(value, isRequired: true))) {
              return "err_msg_please_enter_valid_password".tr;
            }
            return null;
          },
          obscureText: true,
          contentPadding: EdgeInsets.only(top: 15.v, right: 30.h, bottom: 15.v),
          borderDecoration: TextFormFieldStyleHelper.outlineBlueTL5,
          filled: false);
    });
  }

  /// Section Widget
  Widget _buildSave(BuildContext context) {
    return CustomElevatedButton(
        text: "lbl_save".tr,
        margin: EdgeInsets.only(left: 16.h, right: 16.h, bottom: 50.v));
  }

  /// Navigates back to the previous screen.
  onTapArrowLeft(BuildContext context) {
    NavigatorService.goBack();
  }
}
