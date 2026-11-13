import 'package:flutter/material.dart';
import 'package:taskati/core/utils/colors.dart';

class MainButton extends StatelessWidget {
   const MainButton({
    super.key,
    required this.text,
    required this.onpressed,
     this.width = double.infinity,
     this.height = 55,
     this.margin = EdgeInsets.zero,
  });

  final String text;
  final Function() onpressed;
  final double width;
  final double? height;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      child: ElevatedButton(
        onPressed: onpressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primarycolor,

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
