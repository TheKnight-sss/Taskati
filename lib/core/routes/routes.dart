import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:taskati/feature/addtask/add_task_screen.dart';
import 'package:taskati/feature/home/pages/home_screen.dart';
import 'package:taskati/feature/splash/splash_screen.dart';
import 'package:taskati/feature/upload/upload_screen.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class Routes {
  //! splashScreen
  static const String splash = '/';
  //!uploadScreen
  static const String upload = '/upload';
  //!homeScreen
  static const String home = '/home';
  //!addtaskScreen
  static const String addtask = '/addtask';

  static final GoRouter route = GoRouter(
    navigatorKey: navigatorKey,
    routes: [
      GoRoute(path: splash,builder: (context, state) => const SplashScreen()),
      GoRoute(path: upload,builder: (context, state) =>  UploadScreen()),
      GoRoute(path: home,builder: (context, state) =>   HomeScreen()),
      GoRoute(path: addtask,builder: (context, state) =>   AddTaskScreen()),
    ],
  );
}
