import 'package:cached_network_image/cached_network_image.dart';

import '../models/offerbanner_item_model.dart';
import 'package:flutter/material.dart';
import 'package:loginform/core/app_export.dart';

// ignore: must_be_immutable
class OfferbannerItemWidget extends StatelessWidget {
  OfferbannerItemWidget(
    this.offerbannerItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  OfferbannerItemModel offerbannerItemModelObj;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 206.v,
      width: 343.h,
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          CachedNetworkImage(
            imageUrl: offerbannerItemModelObj.imageURL,
            height: 206.v,
            width: 343.h,
            imageBuilder: (context, imageProvider) => Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(5.0)
              ),
            ),
          ),
          /*Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(
                left: 24.h,
                right: 110.h,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 209.h,
                    child: Text(
                      "msg_world_book_day".tr,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.headlineSmall!.copyWith(
                        height: 1.50,
                      ),
                    ),
                  ),
                  SizedBox(height: 27.v),
                  Padding(
                    padding: EdgeInsets.only(right: 59.h),
                    child: Row(
                      children: [
                        Container(
                          width: 42.h,
                          padding: EdgeInsets.symmetric(
                            horizontal: 9.h,
                            vertical: 8.v,
                          ),
                          decoration:
                              AppDecoration.fillOnPrimaryContainer.copyWith(
                            borderRadius: BorderRadiusStyle.roundedBorder5,
                          ),
                          child: Text(
                            "lbl_08".tr,
                            style: theme.textTheme.titleMedium,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: 4.h,
                            top: 10.v,
                            bottom: 9.v,
                          ),
                          child: Text(
                            "lbl".tr,
                            style:
                                CustomTextStyles.titleSmallOnPrimaryContainer,
                          ),
                        ),
                        Container(
                          width: 42.h,
                          margin: EdgeInsets.only(left: 4.h),
                          padding: EdgeInsets.symmetric(
                            horizontal: 9.h,
                            vertical: 8.v,
                          ),
                          decoration:
                              AppDecoration.fillOnPrimaryContainer.copyWith(
                            borderRadius: BorderRadiusStyle.roundedBorder5,
                          ),
                          child: Text(
                            "lbl_34".tr,
                            style: theme.textTheme.titleMedium,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: 4.h,
                            top: 10.v,
                            bottom: 9.v,
                          ),
                          child: Text(
                            "lbl".tr,
                            style:
                                CustomTextStyles.titleSmallOnPrimaryContainer,
                          ),
                        ),
                        Container(
                          width: 42.h,
                          margin: EdgeInsets.only(left: 4.h),
                          padding: EdgeInsets.symmetric(
                            horizontal: 10.h,
                            vertical: 8.v,
                          ),
                          decoration:
                              AppDecoration.fillOnPrimaryContainer.copyWith(
                            borderRadius: BorderRadiusStyle.roundedBorder5,
                          ),
                          child: Text(
                            "lbl_52".tr,
                            style: theme.textTheme.titleMedium,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),*/
        ],
      ),
    );
  }
}
