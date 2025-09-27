import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:taskati/core/constants/taskcolors.dart' ;
import 'package:taskati/core/models/task_model.dart';
import 'package:taskati/core/services/local_helper.dart';
import 'package:taskati/core/utils/appcolor.dart';
import 'package:taskati/core/utils/text_styles.dart';

class TaskListBuilder extends StatefulWidget {
  const TaskListBuilder({
    super.key,
  });

  @override
  State<TaskListBuilder> createState() => _TaskListBuilderState();
}

class _TaskListBuilderState extends State<TaskListBuilder> {
  String selectedDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          DatePicker(
                  width: 70,
                  height: 100,
                  DateTime.now(),
                  initialSelectedDate: DateTime.now(),
                  selectionColor: AppColor.primaryColor,
                  selectedTextColor: Colors.white,
                  onDateChange: (date) {
                    // New date selected
                    setState(() {
                       selectedDate = date.toString();
                    });
                  },
                ),
          Expanded(
            child: ValueListenableBuilder(
              valueListenable: LocalHelper.taskBox.listenable(),
              builder: (context, box , child) { 
                List <TaskModel> tasks = [];
                for (var task in box.values) {
                  if (task.date == selectedDate) {
                    tasks.add(task);
                  }
                }
                return ListView.separated(
                itemBuilder: (context, index) {
                  return TaskItem(
                    model: tasks[index],
                  );
                },
                itemCount: tasks.length,
                separatorBuilder: (context, index) => Gap(10),
              );
               }
            )
            ),
        ],
      ),
    );
    }
}

  Container TaskItem({required model}) {
    return Container(
            padding: EdgeInsets.all(10),
            height: 100,
            decoration: BoxDecoration(
              color: colors[model.color ?? 0],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              spacing: 10,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 5,
                  children: [
                    Text(
                      model.title ?? "",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyles.bodyStyle(
                        color: Colors.white,
                      ),
                    ),
                    Row(
                      spacing: 6,
                      children: [
                        Icon(
                          Icons.access_time_rounded,
                          color: Colors.white,
                          size: 18,
                        ),
                        Text(
                          "${model.startTime} : ${model.endTime}",
                          style: TextStyles.bodyStyle(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      (model.description!.isNotEmpty == true) ? model.description : "--",
                      style: TextStyles.bodyStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Container(width: 2, height: 60, color: Colors.white),
                RotatedBox(
                  quarterTurns: 3,
                  child: Text(
                    model.isCompleted ==true ? "COMPLETED" : "TODO",
                    style: TextStyles.bodyStyle(
                      color: AppColor.accentColor,
                      fontweight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          );
  }

