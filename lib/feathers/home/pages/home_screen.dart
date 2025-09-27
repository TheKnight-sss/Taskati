import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:taskati/core/utils/appcolor.dart';
import 'package:taskati/core/utils/text_styles.dart';
import 'package:taskati/feathers/home/widgets/home_header.dart';
import 'package:taskati/feathers/home/widgets/task_list_builder.dart';
import 'package:taskati/feathers/home/widgets/today_header.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              HomeHeader(),
              Gap(20),
              TodayHeader(),
              Gap(20),
              
              TaskListBuilder(),
            ],
          ),
        ),
      ),
    );
  }
}
