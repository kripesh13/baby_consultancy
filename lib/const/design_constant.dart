import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

EdgeInsets kStandardPadding() =>
    const EdgeInsets.symmetric(horizontal: 12, vertical: 8);

EdgeInsets kPadding() => const EdgeInsets.all(10);

EdgeInsets kVerticalPadding() => const EdgeInsets.symmetric(vertical: 10);

EdgeInsets kHorizontalPadding() => const EdgeInsets.symmetric(horizontal: 10);

bool isMobileView = true;
bool isTabView = true;
BoxConstraints? appConstraints;

const kBottomContainerHeight = 80.0;
const kActiveCardColour = Color.fromARGB(255, 70, 72, 107);
const kInactiveCardColour = Color(0xFF111328);
const kBottomContainerColour = Color.fromARGB(255, 248, 0, 74);

SizedBox widthBox(double width1) {
  return SizedBox(width: width1.w);
}

SizedBox heightBox(double height) {
  return SizedBox(height:  height.h );
}


Size designSize = ScreenUtil.defaultSize;
double deviceHeight = designSize.height;
double deviceWidth = designSize.width;