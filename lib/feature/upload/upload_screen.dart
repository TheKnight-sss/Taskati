import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taskati/core/constants/app_images.dart';
import 'package:taskati/core/functions/dialog.dart';
import 'package:taskati/core/routes/navigation.dart';
import 'package:taskati/core/routes/routes.dart';
import 'package:taskati/core/services/local_helper.dart';
import 'package:taskati/core/utils/colors.dart';
import 'package:taskati/core/widgets/custom_text_field.dart';
import 'package:taskati/core/widgets/main_button.dart';

class UploadScreen extends StatefulWidget {
  const UploadScreen({super.key});

  @override
  State<UploadScreen> createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  String path = "";
  var nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () {
              if (path.isNotEmpty && nameController.text.isNotEmpty) {
                //save the image path and name to hive
                LocalHelper.putUserData(nameController.text, path);
                pushReplacementTo(context, Routes.home);
              } else if (path.isNotEmpty && nameController.text.isEmpty) {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text("Missing Information"),
                      content: Text("Please enter your name"),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text("OK"),
                        ),
                      ],
                    );
                  },
                );
              } else if (path.isEmpty && nameController.text.isNotEmpty) {
                showErrorDialog(context, "Please upload an image");
              } else {
                showErrorDialog(
                  context,
                  "Please upload an image and enter your name",
                );
              }
            },
            child: Text("Done"),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 80,
                  backgroundColor: AppColors.primarycolor,
                  backgroundImage: path.isNotEmpty
                      ? FileImage(File(path))
                      : AssetImage(AppImages.emptyuser),
                ),
                Gap(20),
                MainButton(
                  text: "Upload From Camera",
                  onpressed: () async {
                    await uploadImage(isCamera: true);
                  },
                  width: 300,
                ),
                Gap(15),
                MainButton(
                  text: "Upload From Gallery",
                  onpressed: () async {
                    await uploadImage(isCamera: false);
                  },
                  width: 300,
                ),
                Gap(20),
                Divider(),
                Gap(20),
                CustomTextField(
                  controller: nameController,
                  hint: "Enter your name",
                  prefix: Icon(Icons.person),
                  validatior: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your name";
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> uploadImage({required bool isCamera}) async {
    XFile? file = await ImagePicker().pickImage(
      source: isCamera ? ImageSource.camera : ImageSource.gallery,
    );
    if (file != null) {
      setState(() {
        path = file.path;
      });
    }
  }
}
