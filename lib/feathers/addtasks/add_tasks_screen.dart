import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:taskati/core/utils/appcolor.dart';
import 'package:taskati/core/utils/text_styles.dart';
import 'package:taskati/core/widgets/custom_text_field.dart';
import 'package:taskati/core/widgets/main_button.dart';

class AddTasksScreen extends StatelessWidget {
  const AddTasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 10),
        child: MainButton(text: "Add Task", onPressed: () {}, width: double.infinity),
      ),
      appBar: AppBar(
        title: Text(
          'Add Tasks',
          style: TextStyles.titleStyle(color: Appcolor.primaryColor),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              children: [
                Text('Title',style: TextStyles.titleStyle(),),
              ],
            ),
            CustomTextField(
              hint: 'Enter your title',
            ),
            Gap(10),
            Row(
              children: [
                Text('Description',style: TextStyles.titleStyle(),),
              ],
            ),
            CustomTextField(
              hint: 'Enter your description',
              maxLines: 6,
              minLines: 4,
            ),
            Gap(10),
            Row(
              children: [
                Text('Date',style: TextStyles.titleStyle(),),
              ],
            ),
            CustomTextField(
              hint: 'Enter your date',
              suffixIcon: Icon(Icons.calendar_month),
            ),
            Gap(10),
            Row(  
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Start Time',style: TextStyles.titleStyle(),),
                      CustomTextField(
                        hint: 'Start Time',
                        suffixIcon: Icon(Icons.access_time),
                      ),
                    ],
                  ),
                ),
                Gap(5),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('End Time',style: TextStyles.titleStyle(),),
                      CustomTextField(
                        hint: 'End Time',
                        suffixIcon: Icon(Icons.access_time),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
