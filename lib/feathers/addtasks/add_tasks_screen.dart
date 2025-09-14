import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:taskati/core/utils/appcolor.dart';
import 'package:taskati/core/utils/text_styles.dart';
import 'package:taskati/core/widgets/custom_text_field.dart';
import 'package:taskati/core/widgets/main_button.dart';

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

  List<Color> Colors = [
    Appcolor.redColor,
    Appcolor.primaryColor,
    Appcolor.orangeColor,
  ];

  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 10),
        child: MainButton(
          text: "Add Task",
          onPressed: () {},
          width: double.infinity,
        ),
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
            Row(children: [Text('Title', style: TextStyles.titleStyle())]),
            CustomTextField(
              hint: 'Enter your title',
              controller: titleController,
            ),
            Gap(10),
            Row(
              children: [Text('Description', style: TextStyles.titleStyle())],
            ),
            CustomTextField(
              hint: 'Enter your description',
              maxLines: 6,
              minLines: 4,
              controller: descriptionController,
            ),
            Gap(10),
            DateField(dateController: dateController),
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
                    backgroundColor: Colors[index],
                    child: currentIndex == index
                        ? Icon(Icons.check, color: Appcolor.accentColor)
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
}

class DateField extends StatelessWidget {
  const DateField({super.key, required this.dateController});

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
