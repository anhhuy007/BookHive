import 'package:loginform/presentation/dashboard_page/models/category_item_model.dart';

import 'package:flutter/material.dart';
import 'package:loginform/core/app_export.dart';
import 'package:loginform/widgets/custom_icon_button.dart';
import 'package:image_network/image_network.dart';

// ignore: must_be_immutable
class CategoryItemWidget extends StatelessWidget {
  CategoryItemWidget(
    this.categoriesItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  CategoryItem categoriesItemModelObj;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 70.h,
      child: Padding(
        padding: EdgeInsets.only(bottom: 1.v),
        child: Column(
          children: [
            CustomIconButton(
                height: 70.adaptSize,
                width: 70.adaptSize,
                padding: EdgeInsets.all(5.h),
                child: CircleAvatar(
                    backgroundImage: NetworkImage(
                        categoriesItemModelObj.imageURL ??
                            ImageConstant.imageNotLoaded),
                    radius: 30.0,
                    backgroundColor: Colors.transparent)),
            SizedBox(height: 7.v),
            Text(
              categoriesItemModelObj.name!,
              style: CustomTextStyles.bodySmall10,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
