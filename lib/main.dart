import 'package:flutter/material.dart';
import 'package:taskati/core/constants/appfonts.dart';
import 'package:taskati/core/services/local_helper.dart';
import 'package:taskati/core/utils/AppColor.dart';
import 'package:taskati/feathers/splash/splash_screen.dart';

import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async {
  await Hive.initFlutter();
  await LocalHelper.init();  
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: AppFonts.poppinsfamily,
        appBarTheme: const AppBarTheme(
          surfaceTintColor: Colors.transparent,
        ),
        inputDecorationTheme: InputDecorationTheme(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: AppColor.primaryColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: AppColor.primaryColor),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: AppColor.redColor),
          ),
        ),
      ),
      home: const SplashScreen(),
    );
  }
}
