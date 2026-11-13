import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:taskati/core/models/task_model.dart';
import 'package:taskati/core/services/local_helper.dart';

import 'task_item.dart';

class TaskListBuilder extends StatefulWidget {
  const TaskListBuilder({
    super.key, required this.date,
  });

  final String date;

  @override
  State<TaskListBuilder> createState() => _TaskListBuilderState();
}

class _TaskListBuilderState extends State<TaskListBuilder> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ValueListenableBuilder(
        valueListenable: LocalHelper.taskBox.listenable(),
        builder: (context, box, child) {
          List<TaskModel> tasks = [];
          for(var task in box.values){
            if(task.date == widget.date){
              tasks.add(task);
            }
          }
          return ListView.separated(
            itemCount: tasks.length,
            separatorBuilder: (context, index) => Gap(10),
            itemBuilder: (context, index) {
              return TaskItem(
                task: tasks[index],
              );
            },
          );
        }
      ),
    );
  }
}
