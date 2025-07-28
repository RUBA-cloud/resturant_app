import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:resturant_app/constants/exported_package.dart';

ThemeData appTheme = ThemeData(
  scaffoldBackgroundColor: Colors.white,
  // Responsive Text
  textTheme: TextTheme(
    bodyLarge: TextStyle(fontSize: 32.sp, fontWeight: FontWeight.bold),
    bodyMedium: TextStyle(fontSize: 20.sp),
    bodySmall: TextStyle(fontSize: 16.sp),
    titleLarge: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w600),
  ),

  // Responsive AppBar
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.teal,
    elevation: 0,
    centerTitle: true,
    titleTextStyle: TextStyle(
      fontSize: 20.sp,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    iconTheme: IconThemeData(size: 24.sp, color: Colors.white),
  ),

  // Responsive Input Fields
  inputDecorationTheme: InputDecorationTheme(
    contentPadding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.r),
      borderSide: BorderSide(color: Colors.grey),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.r),
      borderSide: BorderSide(color: Colors.grey),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.r),
      borderSide: BorderSide(color: Colors.teal, width: 1.5.w),
    ),
    hintStyle: TextStyle(fontSize: 14.sp),
    labelStyle: TextStyle(fontSize: 15.sp),
  ),

  // Responsive Buttons
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 24.w),
      textStyle: TextStyle(fontSize: 16.sp),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
    ),
  ),
);
