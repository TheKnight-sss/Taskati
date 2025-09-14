import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';
import 'package:taskati/core/constants/appimages.dart';
import 'package:taskati/core/functions/navigation.dart';
import 'package:taskati/core/services/local_helper.dart';
import 'package:taskati/core/utils/text_styles.dart';
import 'package:taskati/feathers/home/pages/home_screen.dart';
import 'package:taskati/feathers/upload/upload_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    bool isUploaded = LocalHelper.getData('isUploaded') ?? false;
    Future.delayed(const Duration(seconds: 2), () {
      if (isUploaded) {
        pushwithReplacement(context, const HomeScreen());
        return;
      } else {
        pushwithReplacement(context, const UploadScreen());
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
            Lottie.asset(AppImages.logo),
            SizedBox(height: 10),
            Text('Taskati', style: TextStyles.bodyStyle(fontSize: 24)),
            Gap(15),
            Text(
              "It's time to organize your tasks",
              style: TextStyles.smallStyle(
                fontSize: 16,
                color: Colors.grey.shade600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
