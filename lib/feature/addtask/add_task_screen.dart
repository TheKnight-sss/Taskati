import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:taskati/core/models/task_model.dart';
import 'package:taskati/core/routes/navigation.dart';
import 'package:taskati/core/routes/routes.dart';
import 'package:taskati/core/services/local_helper.dart';
import 'package:taskati/core/utils/colors.dart';
import 'package:taskati/core/utils/text_style.dart';
import 'package:taskati/core/widgets/custom_text_field.dart';
import 'package:taskati/core/widgets/main_button.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  var titleController = TextEditingController();
  var descriptionController = TextEditingController();
  var dateController = TextEditingController(
    text: DateFormat("yyyy-MM-dd").format(DateTime.now()),
  );
  var startTimeController = TextEditingController(
    text: DateFormat("hh:mm a").format(DateTime.now()),
  );
  var endTimeController = TextEditingController(
    text: DateFormat("hh:mm a").format(DateTime.now()),
  );

  var formKey = GlobalKey<FormState>();

  List<Color> colors = [
    AppColors.primarycolor,
    AppColors.redcolor,
    AppColors.orangecolor,
  ];

  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Task')),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.fromLTRB(16, 10, 16, 5),
          child: MainButton(onpressed: ()async {
            if(formKey.currentState!.validate()){
              String id = DateTime.now().millisecondsSinceEpoch.toString()+ titleController.text;
              await LocalHelper.putTaskData(id,TaskModel(
                id: id,
                title: titleController.text,
                description: descriptionController.text,
                date: dateController.text,
                startTime: startTimeController.text,
                endTime: endTimeController.text,
                color: currentIndex,
                isCompleted: false,
              ));
              goToBase(context,Routes.home);
            }
          }, text: 'Create Task'),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: _addTaskBody(),
      ),
    );
  }

  SingleChildScrollView _addTaskBody() {
    return SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Title', style: Style.bodyStyle()),
              Gap(6),
              CustomTextField(
                controller: titleController,
                hint: 'Enter Task Title',
                validatior: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter task title';
                  }
                  return null;
                },
              ),
              Gap(10),
              Text('Description (Optional)', style: Style.bodyStyle()),
              Gap(6),
              CustomTextField(
                controller: descriptionController,
                hint: 'Enter Task Description',
                maxLines: 3,
              ),
              Gap(10),
              dateField(),
              Gap(10),
              timeField(),
              Gap(10),
              Row(
                spacing: 6,
                children: List.generate(3, (index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        currentIndex = index;
                      });
                    },
                    child: CircleAvatar(
                      backgroundColor: colors[index],
                      child: currentIndex == index
                          ? Icon(Icons.check, color: Colors.white)
                          : null,
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
      );
  }

  Column dateField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Date', style: Style.bodyStyle()),
        Gap(6),
        CustomTextField(
          controller: dateController,
          readOnly: true,
          ontap: () async {
            var selectedDate = await showDatePicker(
              context: context,
              firstDate: DateTime.now(),
              lastDate: DateTime(2050),
              initialDate: DateTime.now(),
            );
            if (selectedDate != null) {
              dateController.text = DateFormat(
                'yyyy-MM-dd',
              ).format(selectedDate);
            }
          },
          suffix: Icon(Icons.calendar_month, color: AppColors.primarycolor),
        ),
      ],
    );
  }

  Row timeField() {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Start Time', style: Style.bodyStyle()),
              Gap(6),
              CustomTextField(
                controller: startTimeController,
                readOnly: true,
                ontap: () async {
                  var selectedTime = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                  );
                  if (selectedTime != null) {
                    startTimeController.text = selectedTime.format(context);
                  }
                },
                suffix: Icon(
                  Icons.watch_later_rounded,
                  color: AppColors.primarycolor,
                ),
              ),
            ],
          ),
        ),
        Gap(10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('End Time', style: Style.bodyStyle()),
              Gap(6),
              CustomTextField(
                controller: endTimeController,
                readOnly: true,
                ontap: () async {
                  var selectedTime = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                  );
                  if (selectedTime != null) {
                    endTimeController.text = selectedTime.format(context);
                  }
                },
                suffix: Icon(
                  Icons.watch_later_outlined,
                  color: AppColors.primarycolor,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
