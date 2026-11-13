import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';
import 'package:taskati/core/constants/app_images.dart';
import 'package:taskati/core/routes/navigation.dart';
import 'package:taskati/core/routes/routes.dart';
import 'package:taskati/core/services/local_helper.dart';
import 'package:taskati/core/utils/text_style.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    bool isupUploaded = LocalHelper.getData('isUploaded') ?? false;

    Future.delayed(Duration(seconds: 3), () {
      if (isupUploaded) {
        pushReplacementTo(context, Routes.home);
      } else {
        pushReplacementTo(context, Routes.upload);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(AppImages.logojson, width: 250),
            Gap(15),
            Text("Taskati", style: Style.titleStyle(fontsize: 24)),
            Gap(15),
            Text("It\'s time to get organized",style: Style.smallStyle(fontsize: 16),)
          ],
        ),
      ),
    );
  }
}
