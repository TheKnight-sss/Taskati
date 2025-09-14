
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:taskati/feathers/home/widgets/home_header.dart';
import 'package:taskati/feathers/home/widgets/today_header.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
            ],
          ),
        ),
      ),
    );
  }
}
