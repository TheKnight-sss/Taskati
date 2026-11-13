import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:taskati/core/utils/colors.dart';
import 'package:taskati/feature/home/widgets/today_header%20.dart';

import '../widgets/home_header.dart';
import '../widgets/task_list_builder.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _selectedDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Column(
            children: [
              HomeHeader(),
              Gap(16),
              TodayHeader(),
              Gap(20),
              DatePicker(
                width: 70,
                height: 100,
                DateTime.now(),
                initialSelectedDate: DateTime.now(),
                selectionColor: AppColors.primarycolor,
                selectedTextColor: Colors.white,
                onDateChange: (date) {
                  setState(() => _selectedDate = DateFormat('yyyy-MM-dd').format(date));
                },
              ),
              Gap(10),
              TaskListBuilder(date: _selectedDate.toString()),
            ],
          ),
        ),
      ),
    );
  }
}
