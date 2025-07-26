import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:resturant_app/constants/colors.dart';

const TextStyle headingStyle = TextStyle(
  fontFamily: 'Serif',
  fontWeight: FontWeight.bold,
  fontSize: 24,
  color: mainColor,
  height: 1.2,
);
const TextStyle subHeadingStyle = TextStyle(
  fontFamily: 'Serif',
  fontWeight: FontWeight.bold,
  fontSize: 32,
  color: primaryColor,
  height: 1.1,
);
final buttonStyle = ElevatedButton.styleFrom(
  backgroundColor: mainColor,
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
);
