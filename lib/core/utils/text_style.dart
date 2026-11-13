import 'package:flutter/material.dart';
import 'package:taskati/core/utils/colors.dart';

class Style {
  static TextStyle titleStyle({
    Color? color,
    double fontsize = 18,
    FontWeight fontweight = FontWeight.bold
  }){
    return TextStyle(
      fontSize: fontsize,
      fontWeight: fontweight,
      color: color ?? AppColors.darkcolor
    );
  }

  static TextStyle bodyStyle({
    Color? color,
    double fontsize = 16,
    FontWeight fontweight = FontWeight.normal
  }){
    return TextStyle(
      fontSize: fontsize,
      fontWeight: fontweight,
      color: color ?? AppColors.darkcolor
    );
  }
  
  static TextStyle smallStyle({
    Color? color,
    double fontsize = 14,
    FontWeight fontweight = FontWeight.bold
  }){
    return TextStyle(
      fontSize: fontsize,
      fontWeight: fontweight,
      color: color ?? AppColors.greycolor
    );
  }
}