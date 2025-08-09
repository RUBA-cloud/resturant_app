// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:resturant_app/constants/colors.dart';

// LIGHT THEME
final ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  primaryColor: mainColor,
  cardTheme: CardThemeData(color: Colors.white),

  scaffoldBackgroundColor: primaryColor,
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    primary: mainColor,
    secondary: secondColor,
    background: primaryColor,
    surface: Colors.white,
    onPrimary: Colors.white,
    onSecondary: Colors.white,
  ),

  appBarTheme: AppBarTheme(
    backgroundColor: mainColor,
    elevation: 0,
    centerTitle: true,
    titleTextStyle: TextStyle(
      fontSize: 20.sp,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    iconTheme: IconThemeData(size: 24.sp, color: Colors.white),
  ),

  textTheme: TextTheme(
    bodyLarge: TextStyle(
      fontSize: 20.sp,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    bodyMedium: TextStyle(fontSize: 18.sp, color: Colors.black87),
    bodySmall: TextStyle(fontSize: 16.sp, color: Colors.black54),
    titleLarge: TextStyle(
      fontSize: 24.sp,
      fontWeight: FontWeight.w600,
      color: mainColor,
    ),
  ),

  inputDecorationTheme: InputDecorationTheme(
    contentPadding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.r),
      borderSide: BorderSide(color: Colors.grey.shade300),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.r),
      borderSide: BorderSide(color: mainColor, width: 1.5.w),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.r),
      borderSide: BorderSide(color: secondColor, width: 1.5.w),
    ),
    hintStyle: TextStyle(fontSize: 12.sp, color: Colors.grey),
    labelStyle: TextStyle(fontSize: 12.sp, color: Colors.black54),
    errorStyle: TextStyle(fontSize: 10.sp, color: Colors.red),
  ),

  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: secondColor,
      foregroundColor: Colors.white,
      padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 24.w),
      textStyle: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
    ),
  ),
);

// DARK THEME
final ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,
  primaryColor: mainColor.withOpacity(0.5),
  scaffoldBackgroundColor: const Color(0xFF121212),
  cardColor: Colors.transparent.withOpacity(0.05),
  colorScheme: ColorScheme.dark(
    primary: mainColor,
    secondary: secondColor,

    background: Colors.black26,
    surface: const Color(0xFF1F1F1F),
    onPrimary: Colors.white,
    onSecondary: Colors.black.withOpacity(0.4),
  ),
  cardTheme: CardThemeData(color: Colors.blue),

  appBarTheme: AppBarTheme(
    backgroundColor: mainColor,
    elevation: 0,
    centerTitle: true,
    titleTextStyle: TextStyle(
      fontSize: 20.sp,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    iconTheme: IconThemeData(size: 24.sp, color: Colors.white),
  ),

  textTheme: TextTheme(
    bodyLarge: TextStyle(
      fontSize: 20.sp,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    bodyMedium: TextStyle(fontSize: 18.sp, color: Colors.white70),
    bodySmall: TextStyle(fontSize: 16.sp, color: Colors.white60),
    titleLarge: TextStyle(
      fontSize: 24.sp,
      fontWeight: FontWeight.w600,
      color: secondColor,
    ),
  ),

  inputDecorationTheme: InputDecorationTheme(
    contentPadding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.r),
      borderSide: BorderSide(color: Colors.grey.shade600),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.r),
      borderSide: BorderSide(color: mainColor, width: 1.5.w),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.r),
      borderSide: BorderSide(color: secondColor, width: 1.5.w),
    ),
    hintStyle: TextStyle(fontSize: 12.sp, color: Colors.grey.shade400),
    labelStyle: TextStyle(fontSize: 12.sp, color: Colors.grey.shade300),
    errorStyle: TextStyle(fontSize: 10.sp, color: Colors.redAccent),
  ),

  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: secondColor,
      foregroundColor: Colors.white,
      padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 24.w),
      textStyle: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
    ),
  ),
);
