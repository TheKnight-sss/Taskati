import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:taskati/core/functions/navigation.dart';
import 'package:taskati/core/utils/text_styles.dart';
import 'package:taskati/core/widgets/main_button.dart';
import 'package:taskati/feathers/addtasks/add_tasks_screen.dart';

class TodayHeader extends StatelessWidget {
  const TodayHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                DateFormat.yMMMMd().format(DateTime.now()),
                style: TextStyles.titleStyle(),
              ),
              Text(
                "Today",
                style: TextStyles.titleStyle(),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 55,
          child: MainButton(
            text: '+ Add Task',
            width: 140,
            height: 40,
            onPressed: () {
              pushTo(context, AddTasksScreen());
            },
          ),
        ),
      ],
    );
  }
}
