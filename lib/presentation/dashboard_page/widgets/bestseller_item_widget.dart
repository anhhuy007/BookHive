import 'package:cached_network_image/cached_network_image.dart';
import 'package:image_network/image_network.dart';

import '../models/book_item_model.dart';
import '../models/flashsale_item_model.dart';
import 'package:flutter/material.dart';
import 'package:loginform/core/app_export.dart';

// ignore: must_be_immutable
class BestSellerItemWidget extends StatelessWidget {
  BestSellerItemWidget(
    this.bestSellerModelObj, {
    Key? key,
    this.onTapProductItem,
  }) : super(
          key: key,
        );

  BookItem bestSellerModelObj;
  VoidCallback? onTapProductItem;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 141.h,
      child: GestureDetector(
        onTap: () {
          onTapProductItem!.call();
        },
        child: Container(
          padding: EdgeInsets.all(15.h),
          decoration: AppDecoration.outlineBlue.copyWith(
            borderRadius: BorderRadiusStyle.roundedBorder5,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CachedNetworkImage(
                imageUrl: bestSellerModelObj.imageURL,
                height: 109.adaptSize,
                width: 109.adaptSize,
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
              SizedBox(height: 7.v),
              SizedBox(
                width: 105.h,
                height: 35.h,
                child: Text(
                  bestSellerModelObj.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.labelLarge!.copyWith(
                    height: 1.50,
                  ),
                ),
              ),
              SizedBox(height: 10.v),
              Text(
                bestSellerModelObj.price.toString(),
                style: CustomTextStyles.labelLargePrimary,
              ),
              SizedBox(height: 9.v),
              Text(
                bestSellerModelObj.author,
                style: CustomTextStyles.labelMediumPrimary!.copyWith(
                  color: Colors.grey
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
