import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:taskati/core/constants/taskcolors.dart' as TaskColors;
import 'package:taskati/core/functions/navigation.dart';
import 'package:taskati/core/models/task_model.dart';
import 'package:taskati/core/services/local_helper.dart';
import 'package:taskati/core/utils/AppColor.dart';
import 'package:taskati/core/utils/text_styles.dart';
import 'package:taskati/core/widgets/custom_text_field.dart';
import 'package:taskati/core/widgets/main_button.dart';
import 'package:taskati/feathers/home/pages/home_screen.dart';

class AddTasksScreen extends StatefulWidget {
  const AddTasksScreen({super.key});

  @override
  State<AddTasksScreen> createState() => _AddTasksScreenState();
}

class _AddTasksScreenState extends State<AddTasksScreen> {
  var titleController = TextEditingController();
  var descriptionController = TextEditingController();
  var dateController = TextEditingController(
    text: DateFormat('yyyy-MM-dd').format(DateTime.now()),
  );
  var startTimeController = TextEditingController(
    text: DateFormat('hh:mm a').format(DateTime.now()),
  );
  var endTimeController = TextEditingController(
    text: DateFormat('hh:mm a').format(DateTime.now()),
  );
  var formKey = GlobalKey<FormState>();

  

  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 10),
        child: MainButton(
          text: "Create Task",
          onPressed: () async {
            if (formKey.currentState!.validate()) {
              String id = DateTime.now().millisecondsSinceEpoch.toString()+ titleController.text;
            await  LocalHelper.putTask(id, TaskModel(
                id: id,
                title: titleController.text,
                description: descriptionController.text,
                date: dateController.text,
                startTime: startTimeController.text,
                endTime: endTimeController.text,
                color: currentIndex,
                isCompleted: false,
              ));
              pushAndRemoveUntil(context, HomeScreen());
            }
          },
          width: double.infinity,
        ),
      ),
      appBar: AppBar(
        title: Text(
          'Add Tasks',
          style: TextStyles.titleStyle(color: AppColor.primaryColor),
        ),
        centerTitle: true,
      ),
      body: _addTaskBody(),
    );
  }

  SingleChildScrollView _addTaskBody() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Row(children: [Text('Title', style: TextStyles.titleStyle())]),
              CustomTextField(
                hint: 'Enter your title',
                controller: titleController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Title is required';
                  }
                  return null;
                },
              ),
              Gap(10),
              Row(
                children: [Text('Description (Optional)', style: TextStyles.titleStyle())],
              ),
              CustomTextField(
                hint: 'Enter your description',
                maxLines: 6,
                minLines: 4,
                controller: descriptionController,
              ),
              Gap(10),
              _DateField(dateController: dateController),
              Gap(10),
              TimeFields(
                startTimeController: startTimeController,
                endTimeController: endTimeController,
              ),
              Gap(10),
              Row(
                spacing: 8,
                children: List.generate(3, (index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        currentIndex = index;
                      });
                    },
                    child: CircleAvatar(
                      backgroundColor: TaskColors.colors[index],
                      child: currentIndex == index
                          ? Icon(Icons.check, color: AppColor.accentColor)
                          : null,
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DateField extends StatelessWidget {
  const _DateField({required this.dateController});

  final TextEditingController dateController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(children: [Text('Date', style: TextStyles.titleStyle())]),
        CustomTextField(
          controller: dateController,
          readOnly: true,
          onTap: () async {
            var selectedDate = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime.now(),
              lastDate: DateTime(2050),
            );

            if (selectedDate != null) {
              dateController.text = DateFormat('yyyy-MM-dd').format(selectedDate);
            }
          },
          hint: 'Enter your date',
          suffixIcon: Icon(Icons.calendar_month),
        ),
      ],
    );
  }
}

class TimeFields extends StatelessWidget {
  const TimeFields({
    super.key,
    required this.startTimeController,
    required this.endTimeController,
  });

  final TextEditingController startTimeController;
  final TextEditingController endTimeController;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Start Time', style: TextStyles.titleStyle()),
              CustomTextField(
                controller: startTimeController,
                onTap: () async {
                  var selectedTime = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                  );

                  if (selectedTime != null) {
                    startTimeController.text = selectedTime.format(context);
                  }
                },
              ),
            ],
          ),
        ),
        Gap(5),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('End Time', style: TextStyles.titleStyle()),
              CustomTextField(
                controller: endTimeController,
                onTap: () async {
                  var selectedTime = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                  );

                  if (selectedTime != null) {
                    endTimeController.text = selectedTime.format(context);
                  }
                },
                hint: 'End Time',
                suffixIcon: Icon(Icons.access_time),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
