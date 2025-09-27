import 'package:flutter/material.dart';
import 'package:taskati/core/utils/appcolor.dart';

class TextStyles {
  static TextStyle titleStyle({
    Color? color,
    double fontSize = 18,
    FontWeight fontweight = FontWeight.bold,
  }) {
    return TextStyle(
      fontSize: fontSize,
      fontWeight: fontweight,
      color: color ?? AppColor.darkColor,
    );
  }

  static TextStyle smallStyle({
    Color? color,
    double fontSize = 14,
    FontWeight fontweight = FontWeight.normal,
  }) {
    return TextStyle(
      fontSize: fontSize,
      fontWeight: fontweight,
      color: color ?? AppColor.greyColor,
    );
  }

  static TextStyle bodyStyle({
    Color? color,
    double fontSize = 16,
    FontWeight fontweight = FontWeight.normal,
  }) {
    return TextStyle(
      fontSize: fontSize,
      fontWeight: fontweight,
      color: color ?? AppColor.darkColor,
    );
  }
}


