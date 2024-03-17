import 'package:flutter/material.dart';

import 'package:get/get.dart';

class CustomSize {
  CustomSize._();
  static final double screenHeight = Get.mediaQuery.size.height;
  static final double screenWidth = Get.mediaQuery.size.width;
  static const double avatarRadius = 45;
  static const double containerHeight = 55;
  static const double iconSize = 25;
  static const double radius = 8;
  static const double cardradius = 4;
  static const EdgeInsets padding =
      EdgeInsets.symmetric(horizontal: 25, vertical: 14);
  static const EdgeInsets smallpadding =
      EdgeInsets.symmetric(horizontal: 10, vertical: 7);
  static const EdgeInsets horizontalPaddingOnly =
      EdgeInsets.symmetric(horizontal: 25);

  static const EdgeInsets verticalPaddingOnly =
      EdgeInsets.symmetric(vertical: 14);
  static const EdgeInsets appbarPadding =
      EdgeInsets.symmetric(horizontal: 15, vertical: 10);

  static const double horizontalPadding = 24;
  static const double verticalPadding = 14;
}

Widget customVerticalGap([int? height]) {
  height = height ?? 16;
  return SizedBox(height: height.toDouble());
}

Widget customHorizontalGap([int? width]) {
  width = width ?? 16;
  return SizedBox(width: width.toDouble());
}
