import 'package:flutter/material.dart';
import 'package:taskati/core/constants/task_colors.dart';
import 'package:taskati/core/models/task_model.dart';
import 'package:taskati/core/utils/colors.dart';
import 'package:taskati/core/utils/text_style.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({super.key, required this.task});

  final TaskModel task;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color:colors[task.color!],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  task.title!,
                  style: Style.bodyStyle(color: Colors.white),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                Row(
                  spacing: 6,
                  children: [
                    Icon(Icons.watch_later_outlined, color: Colors.white),
                    Text(
                      task.startTime!,
                      style: Style.smallStyle(color: Colors.white),
                    ),
                  ],
                ),
                Text(
                  (task.description?.isNotEmpty == true)?  task.description??"" : "__",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: Style.bodyStyle(color: Colors.white),
                ),
              ],
            ),
          ),
          Spacer(),
          Container(
            width: 1,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          RotatedBox(
            quarterTurns: 3,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                task.isCompleted == true ? "DONE" : "TODO",
                style: Style.smallStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
