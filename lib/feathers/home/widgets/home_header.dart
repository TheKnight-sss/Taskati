import 'dart:io';
import 'package:flutter/material.dart';
import 'package:taskati/core/constants/appimages.dart';
import 'package:taskati/core/services/local_helper.dart';
import 'package:taskati/core/utils/appcolor.dart';
import 'package:taskati/core/utils/text_styles.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Column(
          children: [
            Text(
              "Hello, ${LocalHelper.getData(LocalHelper.xname) ?? 'User'}",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Appcolor.primaryColor,
              ),
            ),
            Text(
              "have a nice day",
              style: TextStyles.smallStyle(color: Appcolor.darkColor),
            ),
          ],
        ),
        Spacer(),
        CircleAvatar(
          radius: 20,
          backgroundColor: Appcolor.primaryColor,
          backgroundImage: LocalHelper.getData(LocalHelper.ximage).isNotEmpty
              ? FileImage(File(LocalHelper.getData(LocalHelper.ximage)))
              : AssetImage(AppImages.emptyUser),
        ),
      ],
    );
  }
}
