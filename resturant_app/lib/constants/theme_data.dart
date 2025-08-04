import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:resturant_app/constants/colors.dart';

// LIGHT THEME
final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: Colors.white,

  textTheme: TextTheme(
    bodyLarge: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
    bodyMedium: TextStyle(fontSize: 18.sp),
    bodySmall: TextStyle(fontSize: 16.sp),
    titleLarge: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w600),
  ),

  appBarTheme: AppBarTheme(
    backgroundColor: mainColor,
    elevation: 0,
    centerTitle: true,
    titleTextStyle: TextStyle(
      fontSize: 20.sp,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    iconTheme: IconThemeData(size: 24.sp, color: Colors.white),
  ),

  inputDecorationTheme: InputDecorationTheme(
    contentPadding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 8.w),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.r),
      borderSide: BorderSide(color: Colors.grey, width: 1.5.w),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.r),
      borderSide: BorderSide(color: mainColor, width: 1.5.w),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.r),
      borderSide: BorderSide(color: mainColor, width: 1.5.w),
    ),
    hintStyle: TextStyle(fontSize: 10.sp),
    labelStyle: TextStyle(fontSize: 10.sp),
    errorStyle: TextStyle(fontSize: 10.sp, color: Colors.red),
  ),

  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 24.w),
      textStyle: TextStyle(fontSize: 8.sp),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
    ),
  ),
);

// DARK THEME
final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: Colors.black,

  textTheme: TextTheme(
    bodyLarge: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold, color: Colors.white),
    bodyMedium: TextStyle(fontSize: 18.sp, color: Colors.white70),
    bodySmall: TextStyle(fontSize: 16.sp, color: Colors.white60),
    titleLarge: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w600, color: Colors.white),
  ),

  appBarTheme: AppBarTheme(
    backgroundColor: mainColor,
    elevation: 0,
    centerTitle: true,
    titleTextStyle: TextStyle(
      fontSize: 20.sp,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    iconTheme: IconThemeData(size: 24.sp, color: Colors.white),
  ),

  inputDecorationTheme: InputDecorationTheme(
    contentPadding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 8.w),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.r),
      borderSide: BorderSide(color: Colors.grey.shade700, width: 1.5.w),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.r),
      borderSide: BorderSide(color: mainColor, width: 1.5.w),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.r),
      borderSide: BorderSide(color: mainColor, width: 1.5.w),
    ),
    hintStyle: TextStyle(fontSize: 10.sp, color: Colors.grey.shade400),
    labelStyle: TextStyle(fontSize: 10.sp, color: Colors.grey.shade300),
    errorStyle: TextStyle(fontSize: 10.sp, color: Colors.redAccent),
  ),

  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 24.w),
      textStyle: TextStyle(fontSize: 8.sp),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
    ),
  ),
);
