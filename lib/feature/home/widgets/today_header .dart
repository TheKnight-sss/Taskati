import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:taskati/core/routes/navigation.dart';
import 'package:taskati/core/routes/routes.dart';
import 'package:taskati/core/utils/text_style.dart';
import 'package:taskati/core/widgets/main_button.dart';

class TodayHeader extends StatelessWidget {
  const TodayHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                DateFormat("MMMM d,y").format(DateTime.now()),
                style: Style.titleStyle(),
              ),
              Text("Today"),
            ],
          ),
        ),
        MainButton(
          text: "+ Add Task",
          onpressed: () {
            pushTo(context, Routes.addtask);
          },
          width: 150,
          height: 40,
        ),
      ],
    );
  }
}
