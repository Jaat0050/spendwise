import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:spendwise_app/aLocalAndRemoteData/local/constant.dart';
import 'package:spendwise_app/data/appColors.dart';

class AppCommonWidget {
  Widget circularImageViewBuilder({required String imageLink, required double radius, required double iconSize}) {
    return SizedBox(
      height: radius,
      width: radius,
      child: ClipOval(
        child: imageLink.isEmpty
            ? Container(
                decoration: BoxDecoration(shape: BoxShape.circle, color: appColors.blackColor),
                child: Center(child: Text(constant.userNameFirstLetter, style: TextStyle(color: appColors.whiteColor, fontSize: iconSize))),
              )
            : CachedNetworkImage(
                imageUrl: imageLink,
                fit: BoxFit.cover,
                errorWidget: (context, url, error) => Container(
                  decoration: BoxDecoration(shape: BoxShape.circle, color: appColors.blackColor),
                  child: Center(child: Text(constant.userNameFirstLetter, style: TextStyle(color: appColors.whiteColor, fontSize: iconSize))),
                ),
                placeholder: (context, url) => Center(child: CircularProgressIndicator()),
              ),
      ),
    );
  }
}

AppCommonWidget appCommonWidget = AppCommonWidget();
