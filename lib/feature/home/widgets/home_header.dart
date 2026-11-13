import 'dart:io';
import 'package:flutter/material.dart';
import 'package:taskati/core/constants/app_images.dart';
import 'package:taskati/core/services/local_helper.dart';
import 'package:taskati/core/utils/colors.dart';
import 'package:taskati/core/utils/text_style.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hello, ${LocalHelper.getData(LocalHelper.kname)}",
                style: Style.titleStyle(
                  color: AppColors.primarycolor,
                ),
              ),
              Text("Have a nice day!"),
            ],
          ),
        ),
        CircleAvatar(
          backgroundColor: AppColors.primarycolor,
          backgroundImage: LocalHelper.getData(LocalHelper.kisuploaded) != null
              ? FileImage(File(LocalHelper.getData(LocalHelper.kimage)))
              : AssetImage(AppImages.emptyuser),
        ),
      ],
    );
  }
}
