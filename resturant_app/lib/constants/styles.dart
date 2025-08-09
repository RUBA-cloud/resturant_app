import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:resturant_app/constants/colors.dart';

bool isDarkMode = Get.isDarkMode;
TextStyle headingStyle = TextStyle(
  fontFamily: 'Serif',
  fontWeight: FontWeight.bold,
  fontSize: 24.r,
  color: isDarkMode ? secondColor : primaryColor,
  height: 1.2,
);

TextStyle subHeadingStyle = TextStyle(
  fontFamily: 'Serif',
  fontWeight: FontWeight.bold,
  fontSize: 32.r,
  color: isDarkMode ? secondColor : primaryColor,
  height: 1.1,
);

TextStyle textStyle = TextStyle(
  fontFamily: 'Serif',
  fontWeight: FontWeight.bold,
  fontSize: 24.r,
  color: Get.isDarkMode ? secondColor : mainColor,
  height: 1.2,
);

final buttonStyle = ElevatedButton.styleFrom(
  backgroundColor: Get.isDarkMode ? secondColor : mainColor,
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
);
final buttonWhiteStyle = ElevatedButton.styleFrom(
  textStyle: subHeadingStyle,
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
);
final TextStyle boldTextStyle = TextStyle(
  fontFamily: 'Serif',
  fontWeight: FontWeight.bold,
  fontSize: 12.r,
);
final textTextStyle = TextStyle(
  fontFamily: 'Serif',
  fontWeight: FontWeight.bold,
  fontSize: 12.r,
  color: whiteColor,
);
final boxDecoration = BoxDecoration(
  color: mainColor,
  borderRadius: const BorderRadius.only(
    topLeft: Radius.circular(32),
    topRight: Radius.circular(32),
    bottomLeft: Radius.circular(24),
    bottomRight: Radius.circular(24),
  ),
  boxShadow: [
    BoxShadow(
      // ignore: deprecated_member_use
      color: isDarkMode ? Colors.white : Colors.black.withOpacity(0.08),
      blurRadius: 16,
      offset: const Offset(0, 8),
    ),
  ],
);
